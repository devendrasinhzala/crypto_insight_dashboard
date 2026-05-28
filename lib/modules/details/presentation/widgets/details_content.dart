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
import 'details_metric_grid.dart';
import 'details_metric_item.dart';
import 'details_section_card.dart';
import 'price_line_chart.dart';

class DetailsContent extends StatelessWidget {
  const DetailsContent({required this.details, super.key});

  final CoinDetailsEntity details;

  double get volatilityScore {
    final week = (details.priceChangePercentage7d ?? 0).abs();
    final month = (details.priceChangePercentage30d ?? 0).abs();
    return (week + month) / 2;
  }

  Color get volatilityColor {
    final score = volatilityScore;
    if (score <= 5) {
      return AppColors.green;
    }
    return AppColors.red;
  }

  String _formatCurrency(double? value) {
    if (value == null) return AppStrings.noData;
    return NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(value);
  }

  String _formatCompact(double? value) {
    if (value == null) return AppStrings.noData;
    return NumberFormat.compactCurrency(symbol: '\$').format(value);
  }

  String _formatNumber(double? value) {
    if (value == null) return AppStrings.noData;
    return NumberFormat.compact().format(value);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppPaddings.screenHorizontal,
      children: <Widget>[
        const SizedBox(height: AppSizes.xl),
        Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: (details.image == null || details.image!.isEmpty)
                  ? null
                  : NetworkImage(details.image!),
              child: (details.image == null || details.image!.isEmpty)
                  ? Image.asset(
                      AppImages.bitcoinConvert,
                      width: AppSizes.xl,
                      height: AppSizes.xl,
                    )
                  : null,
            ),
            const SizedBox(width: AppSizes.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    details.name ?? AppStrings.noData,
                    style: AppTextStyles.heading3,
                  ),
                  Text(
                    (details.symbol ?? AppStrings.noData).toUpperCase(),
                    style: AppTextStyles.bodyMedium,
                  ),
                ],
              ),
            ),
            Text(
              _formatCurrency(details.currentPrice),
              style: AppTextStyles.priceText,
            ),
          ],
        ),
        const SizedBox(height: AppSizes.xl),
        Container(
          padding: AppPaddings.card,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: volatilityColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: Text(
                  '${AppStrings.volatilityScore}: ${volatilityScore.toStringAsFixed(2)}',
                  style: AppTextStyles.bodyLarge,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.xl),
        Container(
          height: 140,
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: PriceLineChart(
            prices: details.sparklineInUsd ?? <double>[],
          ),
        ),
        const SizedBox(height: AppSizes.xl),
        DetailsMetricGrid(
          title: AppStrings.marketCap,
          children: [
            DetailsMetricItem(
              label: AppStrings.marketCapRank,
              value: details.marketCapRank?.toString() ?? AppStrings.noData,
            ),
            DetailsMetricItem(
              label: AppStrings.marketCap,
              value: _formatCompact(details.marketCap),
            ),
            DetailsMetricItem(
              label: AppStrings.volume24h,
              value: _formatCompact(details.totalVolume),
            ),
            DetailsMetricItem(
              label: AppStrings.high24h,
              value: _formatCurrency(details.high24h),
            ),
            DetailsMetricItem(
              label: AppStrings.low24h,
              value: _formatCurrency(details.low24h),
            ),
            DetailsMetricItem(
              label: AppStrings.allTimeHigh,
              value: _formatCurrency(details.ath),
            ),
            DetailsMetricItem(
              label: AppStrings.allTimeLow,
              value: _formatCurrency(details.atl),
            ),
            DetailsMetricItem(
              label: AppStrings.circulatingSupply,
              value: _formatNumber(details.circulatingSupply),
            ),
            DetailsMetricItem(
              label: AppStrings.maxSupply,
              value: _formatNumber(details.maxSupply),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.xl),
        DetailsSectionCard(
          title: AppStrings.description,
          child: Text(
            (details.description == null || details.description!.isEmpty)
                ? AppStrings.noData
                : details.description!,
            style: AppTextStyles.bodyMedium,
          ),
        ),
        const SizedBox(height: AppSizes.xl),
        DetailsSectionCard(
          title: AppStrings.categories,
          child: Wrap(
            spacing: AppSizes.sm,
            runSpacing: AppSizes.sm,
            children: (details.categories == null || details.categories!.isEmpty)
                ? <Widget>[const Text(AppStrings.noData)]
                : details.categories!
                    .map(
                      (category) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.md,
                          vertical: AppSizes.xs,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.iconBackground,
                          borderRadius: BorderRadius.circular(AppRadius.lg),
                        ),
                        child: Text(category, style: AppTextStyles.bodySmall),
                      ),
                    )
                    .toList(growable: false),
          ),
        ),
        const SizedBox(height: AppSizes.xl),
        DetailsSectionCard(
          title: AppStrings.links,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsMetricItem(
                label: AppStrings.officialWebsite,
                value: details.websiteUrl ?? AppStrings.noData,
              ),
              const SizedBox(height: AppSizes.sm),
              DetailsMetricItem(
                label: AppStrings.whitepaper,
                value: details.whitepaperUrl ?? AppStrings.noData,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.bottomSpace),
      ],
    );
  }
}

