import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/coin_details_entity.dart';
import 'price_line_chart.dart';

enum _ChartRange {
  today(AppStrings.today, Duration(days: 1)),
  oneWeek(AppStrings.oneWeek, Duration(days: 7)),
  oneMonth(AppStrings.oneMonth, Duration(days: 30)),
  threeMonths(AppStrings.threeMonths, Duration(days: 90)),
  oneYear(AppStrings.oneYear, Duration(days: 365));

  const _ChartRange(this.label, this.duration);

  final String label;
  final Duration duration;
}

class DetailsContent extends StatefulWidget {
  const DetailsContent({required this.details, super.key});

  final CoinDetailsEntity details;

  @override
  State<DetailsContent> createState() => _DetailsContentState();
}

class _DetailsContentState extends State<DetailsContent> {
  _ChartRange _selectedRange = _ChartRange.today;

  CoinDetailsEntity get details => widget.details;

  double get _changePercentage {
    return details.priceChangePercentage7d ??
        details.priceChangePercentage30d ??
        0;
  }

  bool get _isPositive => _changePercentage >= 0;

  List<double> get _visiblePrices {
    final prices = details.sparklineInUsd ?? <double>[];
    if (prices.length < 2 || _selectedRange != _ChartRange.today) {
      return prices;
    }

    return prices.sublist(prices.length > 24 ? prices.length - 24 : 0);
  }

  String _formatCurrency(double? value) {
    if (value == null) return AppStrings.noData;
    return NumberFormat.currency(symbol: r'$', decimalDigits: 2).format(value);
  }

  String _formatCompact(double? value) {
    if (value == null) return AppStrings.noData;
    return NumberFormat.compactCurrency(symbol: r'$').format(value);
  }

  String _formatNumber(double? value) {
    if (value == null) return AppStrings.noData;
    return NumberFormat.compact().format(value);
  }

  String _cleanDescription(String? value) {
    final raw = value ?? '';
    if (raw.trim().isEmpty) {
      return AppStrings.noData;
    }

    return raw
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&nbsp;', ' ')
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppPaddings.screenHorizontal,
      children: [
        const SizedBox(height: AppSizes.md),
        _PriceSummaryCard(
          details: details,
          price: _formatCurrency(details.currentPrice),
          change: _changePercentage,
          isPositive: _isPositive,
        ),
        const SizedBox(height: AppSizes.md),
        _RangeSelector(
          selectedRange: _selectedRange,
          onSelected: (range) {
            setState(() {
              _selectedRange = range;
            });
          },
        ),
        const SizedBox(height: AppSizes.md),
        SizedBox(
          height: 215,
          child: PriceLineChart(
            prices: _visiblePrices,
            range: _selectedRange.duration,
          ),
        ),
        const SizedBox(height: AppSizes.xl),
        _TopMetricRow(
          rank: details.marketCapRank?.toString() ?? AppStrings.noData,
          marketCap: _formatCompact(details.marketCap),
        ),
        const SizedBox(height: 26),
        const _SectionTitle(AppStrings.statistics),
        const SizedBox(height: AppSizes.md),
        _DetailsCard(
          child: _StatisticsGrid(
            items: [
              _MetricData(
                AppStrings.marketCap,
                _formatCompact(details.marketCap),
              ),
              _MetricData(
                AppStrings.volume24h,
                _formatCompact(details.totalVolume),
              ),
              _MetricData(AppStrings.high24h, _formatCurrency(details.high24h)),
              _MetricData(AppStrings.low24h, _formatCurrency(details.low24h)),
              _MetricData(AppStrings.allTimeHigh, _formatCurrency(details.ath)),
              _MetricData(AppStrings.allTimeLow, _formatCurrency(details.atl)),
              _MetricData(
                AppStrings.circulatingSupply,
                _formatNumber(details.circulatingSupply),
                subtitle: (details.symbol ?? '').toUpperCase(),
              ),
              _MetricData(
                AppStrings.maxSupply,
                _formatNumber(details.maxSupply),
                subtitle: (details.symbol ?? '').toUpperCase(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 26),
        const _SectionTitle(AppStrings.statistics),
        const SizedBox(height: AppSizes.md),
        _DetailsCard(
          child: _DescriptionText(text: _cleanDescription(details.description)),
        ),
        const SizedBox(height: 26),
        const _SectionTitle(AppStrings.categories),
        const SizedBox(height: AppSizes.md),
        _DetailsCard(
          child: _CategoryChips(categories: details.categories ?? <String>[]),
        ),
        const SizedBox(height: 26),
        const _SectionTitle(AppStrings.categories),
        const SizedBox(height: AppSizes.md),
        _DetailsCard(
          child: _LinksList(
            websiteUrl: details.websiteUrl,
            whitepaperUrl: details.whitepaperUrl,
          ),
        ),
        const SizedBox(height: AppSizes.bottomSpace),
      ],
    );
  }
}

class _PriceSummaryCard extends StatelessWidget {
  const _PriceSummaryCard({
    required this.details,
    required this.price,
    required this.change,
    required this.isPositive,
  });

  final CoinDetailsEntity details;
  final String price;
  final double change;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    final symbol = (details.symbol ?? '').toUpperCase();
    final currentPrice = details.currentPrice ?? 0;
    final changeAmount = currentPrice * (change.abs() / 100);

    return Container(
      height: 87,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFA140F7), Color(0xFF4A63F0)],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CoinAvatar(image: details.image),
                const Spacer(),
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: details.name ?? AppStrings.noData,
                    style: AppTextStyles.whiteMedium.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: ' $symbol',
                        style: AppTextStyles.whiteMedium.copyWith(
                          color: AppColors.white.withValues(alpha: 0.68),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price,
                style: AppTextStyles.heading2.copyWith(
                  color: AppColors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSizes.xs),
              Text(
                '${isPositive ? '+' : '-'}${change.abs().toStringAsFixed(2)}% (${_formatInlineCurrency(changeAmount)})',
                style: AppTextStyles.bodySmall.copyWith(
                  color: isPositive ? const Color(0xFF21D997) : AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatInlineCurrency(double value) {
    return NumberFormat.currency(symbol: r'$', decimalDigits: 2).format(value);
  }
}

class _CoinAvatar extends StatelessWidget {
  const _CoinAvatar({this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    final hasImage = image != null && image!.isNotEmpty;

    return Container(
      width: 24,
      height: 24,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.18),
        shape: BoxShape.circle,
      ),
      child: hasImage
          ? Image.network(image!)
          : Image.asset(AppImages.bitcoinConvert),
    );
  }
}

class _RangeSelector extends StatelessWidget {
  const _RangeSelector({required this.selectedRange, required this.onSelected});

  final _ChartRange selectedRange;
  final ValueChanged<_ChartRange> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _ChartRange.values
          .map((range) {
            final isSelected = selectedRange == range;

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: InkWell(
                  onTap: () => onSelected(range),
                  borderRadius: BorderRadius.circular(AppRadius.full),
                  child: Container(
                    height: 34,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF07111F)
                          : AppColors.white.withValues(alpha: 0.72),
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                    child: Text(
                      range.label,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: isSelected
                            ? AppColors.white
                            : AppColors.textPrimary,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            );
          })
          .toList(growable: false),
    );
  }
}

class _TopMetricRow extends StatelessWidget {
  const _TopMetricRow({required this.rank, required this.marketCap});

  final String rank;
  final String marketCap;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-AppSizes.pageHorizontal, 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.72),
          ),
          child: Row(
            children: [
              Expanded(
                child: _MetricItem(
                  label: AppStrings.marketCapRank,
                  value: '#$rank',
                ),
              ),
              Expanded(
                child: _MetricItem(
                  label: AppStrings.marketCap,
                  value: marketCap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.02),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _StatisticsGrid extends StatelessWidget {
  const _StatisticsGrid({required this.items});

  final List<_MetricData> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 26,
      children: items
          .map((item) {
            return SizedBox(
              width: (MediaQuery.of(context).size.width - 64) / 2,
              child: _MetricItem(
                label: item.label,
                value: item.value,
                subtitle: item.subtitle,
              ),
            );
          })
          .toList(growable: false),
    );
  }
}

class _MetricData {
  const _MetricData(this.label, this.value, {this.subtitle});

  final String label;
  final String value;
  final String? subtitle;
}

class _MetricItem extends StatelessWidget {
  const _MetricItem({required this.label, required this.value, this.subtitle});

  final String label;
  final String value;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: const Color(0xFF707783),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (subtitle != null && subtitle!.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            subtitle!,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}

class _DescriptionText extends StatelessWidget {
  const _DescriptionText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          text,
          maxLines: 7,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyMedium.copyWith(
            color: const Color(0xFF707783),
            height: 1.55,
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        Text(
          'Read more',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _CategoryChips extends StatelessWidget {
  const _CategoryChips({required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return Text(AppStrings.noData, style: AppTextStyles.bodyMedium);
    }

    return Wrap(
      spacing: AppSizes.sm,
      runSpacing: AppSizes.md,
      children: categories
          .take(8)
          .map((category) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              decoration: BoxDecoration(
                color: AppColors.scaffoldBackground,
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Text(
                category,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: const Color(0xFF707783),
                ),
              ),
            );
          })
          .toList(growable: false),
    );
  }
}

class _LinksList extends StatelessWidget {
  const _LinksList({this.websiteUrl, this.whitepaperUrl});

  final String? websiteUrl;
  final String? whitepaperUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _LinkRow(label: AppStrings.officialWebsite, value: websiteUrl),
        const SizedBox(height: AppSizes.xxl),
        _LinkRow(label: AppStrings.whitepaper, value: whitepaperUrl),
      ],
    );
  }
}

class _LinkRow extends StatelessWidget {
  const _LinkRow({required this.label, this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            value == null || value!.isEmpty ? label : label,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Icon(
          Icons.open_in_new_rounded,
          color: AppColors.black.withValues(alpha: 0.38),
          size: 22,
        ),
      ],
    );
  }
}
