import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/coin_entity.dart';

class TrendingCoinTile extends StatelessWidget {
  final CoinEntity coin;
  final VoidCallback? onTap;

  const TrendingCoinTile({super.key, required this.coin, this.onTap});

  bool get isPositive => (coin.priceChange24hPercentage ?? 0) >= 0;

  String get formattedDate {
    final rawDate = coin.lastUpdated;
    if (rawDate == null || rawDate.isEmpty) {
      return '-';
    }
    final date = DateTime.tryParse(rawDate);
    if (date == null) {
      return '-';
    }

    return DateFormat('dd MMM • hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.xl),
      child: Container(
        padding: AppPaddings.card,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
        child: Row(
          children: [
            Container(
              height: 54,
              width: 54,
              padding: const EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                color: AppColors.iconBackground,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Image.network(coin.image),
            ),

            const SizedBox(width: AppSizes.lg),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          coin.name,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      const SizedBox(width: AppSizes.xs),

                      Text(
                        '#${coin.marketCapRank ?? '-'}',
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSizes.xs),

                  Text(formattedDate, style: AppTextStyles.bodySmall),

                  const SizedBox(height: AppSizes.xs),

                  Row(
                    children: [
                      Text(
                        '\$${(coin.priceChange24h ?? 0).toStringAsFixed(2)}',
                        style: isPositive
                            ? AppTextStyles.percentagePositive
                            : AppTextStyles.percentageNegative,
                      ),

                      const SizedBox(width: AppSizes.sm),

                      Text(
                        '(${(coin.priceChange24hPercentage ?? 0).toStringAsFixed(2)}%)',
                        style: isPositive
                            ? AppTextStyles.percentagePositive
                            : AppTextStyles.percentageNegative,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: AppSizes.md),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${(coin.currentPrice ?? 0).toStringAsFixed(2)}',
                  style: AppTextStyles.priceText,
                ),

                const SizedBox(height: AppSizes.sm),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: isPositive
                        ? Colors.green.withOpacity(0.12)
                        : Colors.red.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                  ),
                  child: Text(
                    isPositive ? AppStrings.up : AppStrings.down,
                    style: TextStyle(
                      color: isPositive ? AppColors.green : AppColors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
