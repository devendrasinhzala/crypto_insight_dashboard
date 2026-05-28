import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_sizes.dart';
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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.network(coin.image, height: 26, width: 26),
                      const SizedBox(width: AppSizes.lg),
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

                      Container(
                        padding: EdgeInsets.all(AppSizes.xxs),
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(AppRadius.md),
                        ),
                        child: Text(
                          '#${coin.marketCapRank ?? '-'}',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '\$${(coin.currentPrice ?? 0).toStringAsFixed(2)}',
                  style: AppTextStyles.priceText,
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Text(formattedDate, style: AppTextStyles.bodySmall),
                ),

                Image.asset(
                  isPositive ? AppImages.graphUp : AppImages.graphDown,
                  height: 24,
                  width: 50,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${(coin.priceChange24hPercentage ?? 0).toStringAsFixed(2)}%',
                      style: isPositive
                          ? AppTextStyles.percentagePositive
                          : AppTextStyles.percentageNegative,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Text(
                      '\$${(coin.priceChange24h ?? 0).toStringAsFixed(2)}',
                      style: AppTextStyles.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
