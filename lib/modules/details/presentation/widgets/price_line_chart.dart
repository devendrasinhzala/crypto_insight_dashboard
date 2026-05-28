import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class PriceLineChart extends StatefulWidget {
  const PriceLineChart({required this.prices, required this.range, super.key});

  final List<double> prices;
  final Duration range;

  @override
  State<PriceLineChart> createState() => _PriceLineChartState();
}

class _PriceLineChartState extends State<PriceLineChart> {
  static const double _rightTitlesWidth = 52;
  static const double _tooltipWidth = 136;
  static const double _tooltipHeight = 58;

  FlSpot? _touchedSpot;

  List<double> get prices => widget.prices;

  String _formatAxisPrice(double value) {
    return NumberFormat.compactCurrency(symbol: r'$').format(value);
  }

  String _formatTooltipPrice(double value) {
    return NumberFormat.currency(symbol: r'$', decimalDigits: 2).format(value);
  }

  DateTime _dateForIndex(int index) {
    if (prices.length <= 1) {
      return DateTime.now();
    }

    final remainingRatio = (prices.length - 1 - index) / (prices.length - 1);
    final offset = widget.range.inMilliseconds * remainingRatio;
    return DateTime.now().subtract(Duration(milliseconds: offset.round()));
  }

  @override
  Widget build(BuildContext context) {
    if (prices.length < 2) {
      return const Center(child: Text(AppStrings.graphPlaceholder));
    }

    final spots = <FlSpot>[
      for (var i = 0; i < prices.length; i++) FlSpot(i.toDouble(), prices[i]),
    ];
    final minY = prices.reduce((a, b) => a < b ? a : b);
    final maxY = prices.reduce((a, b) => a > b ? a : b);
    final isFlat = (maxY - minY).abs() < 0.000001;
    final chartMinY = isFlat ? minY - 1 : minY;
    final chartMaxY = isFlat ? maxY + 1 : maxY;
    final isUpTrend = prices.last >= prices.first;
    final lineColor = isUpTrend ? AppColors.green : AppColors.red;
    final yInterval = ((chartMaxY - chartMinY) / 3).abs();
    final xInterval = ((prices.length - 1) / 5).clamp(1, prices.length);

    return LayoutBuilder(
      builder: (context, constraints) {
        final chartWidth = constraints.maxWidth - _rightTitlesWidth;
        final chartHeight = constraints.maxHeight;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            LineChart(
              LineChartData(
                minX: 0,
                maxX: (prices.length - 1).toDouble(),
                minY: chartMinY,
                maxY: chartMaxY,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: yInterval == 0 ? 1 : yInterval,
                  verticalInterval: xInterval.toDouble(),
                  getDrawingHorizontalLine: (_) => FlLine(
                    color: AppColors.black.withValues(alpha: 0.07),
                    strokeWidth: 1,
                    dashArray: [2, 3],
                  ),
                  getDrawingVerticalLine: (_) => FlLine(
                    color: AppColors.black.withValues(alpha: 0.07),
                    strokeWidth: 1,
                    dashArray: [2, 3],
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 24,
                      interval: xInterval.toDouble(),
                      getTitlesWidget: (value, meta) {
                        final index = value.round().clamp(0, prices.length - 1);
                        final date = _dateForIndex(index);

                        return SideTitleWidget(
                          meta: meta,
                          space: 8,
                          child: Text(
                            DateFormat('HH:mm').format(date),
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.black,
                              fontSize: 10,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: _rightTitlesWidth,
                      interval: yInterval == 0 ? 1 : yInterval,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          meta: meta,
                          space: 8,
                          child: Text(
                            _formatAxisPrice(value),
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineTouchData: LineTouchData(
                  handleBuiltInTouches: false,
                  touchCallback: (event, response) {
                    final touchedSpots = response?.lineBarSpots;
                    if (touchedSpots == null || touchedSpots.isEmpty) {
                      return;
                    }

                    final spot = touchedSpots.first;
                    setState(() {
                      _touchedSpot = FlSpot(spot.x, spot.y);
                    });
                  },
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: lineColor,
                    barWidth: 2.5,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: lineColor.withValues(alpha: 0.15),
                    ),
                  ),
                ],
              ),
            ),
            if (_touchedSpot != null)
              _ChartTooltip(
                spot: _touchedSpot!,
                maxSpotX: (prices.length - 1).toDouble(),
                chartMinY: chartMinY,
                chartMaxY: chartMaxY,
                chartWidth: chartWidth,
                chartHeight: chartHeight,
                tooltipWidth: _tooltipWidth,
                tooltipHeight: _tooltipHeight,
                price: _formatTooltipPrice(_touchedSpot!.y),
                date: DateFormat(
                  'MMM d, hh:mm a',
                ).format(_dateForIndex(_touchedSpot!.x.round())),
              ),
          ],
        );
      },
    );
  }
}

class _ChartTooltip extends StatelessWidget {
  const _ChartTooltip({
    required this.spot,
    required this.maxSpotX,
    required this.chartMinY,
    required this.chartMaxY,
    required this.chartWidth,
    required this.chartHeight,
    required this.tooltipWidth,
    required this.tooltipHeight,
    required this.price,
    required this.date,
  });

  final FlSpot spot;
  final double maxSpotX;
  final double chartMinY;
  final double chartMaxY;
  final double chartWidth;
  final double chartHeight;
  final double tooltipWidth;
  final double tooltipHeight;
  final String price;
  final String date;

  @override
  Widget build(BuildContext context) {
    final xRatio = maxSpotX == 0 ? 0.0 : spot.x / maxSpotX;
    final valueRange = chartMaxY - chartMinY;
    final yRatio = valueRange == 0 ? 0.5 : (spot.y - chartMinY) / valueRange;
    final rawLeft = (xRatio * chartWidth) - (tooltipWidth / 2);
    final rawTop = ((1 - yRatio) * chartHeight) - tooltipHeight - 10;
    final left = rawLeft.clamp(0.0, chartWidth - tooltipWidth);
    final top = rawTop.clamp(0.0, chartHeight - tooltipHeight);

    return Positioned(
      left: left,
      top: top,
      child: IgnorePointer(
        child: Container(
          width: tooltipWidth,
          height: tooltipHeight,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.black.withValues(alpha: 0.12)),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: AppColors.black.withValues(alpha: 0.10),
                blurRadius: 9,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: const Color(0xFF07BA76),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
