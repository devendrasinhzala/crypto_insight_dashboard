import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';

class PriceLineChart extends StatelessWidget {
  const PriceLineChart({required this.prices, super.key});

  final List<double> prices;

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

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: (prices.length - 1).toDouble(),
        minY: chartMinY,
        maxY: chartMaxY,
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: lineColor,
            barWidth: 2.5,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: lineColor.withOpacity(0.15),
            ),
          ),
        ],
      ),
    );
  }
}

