import 'package:flutter/material.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/coin_entity.dart';

class RecentlyViewedCard extends StatelessWidget {
  final CoinEntity coin;
  final VoidCallback? onTap;

  const RecentlyViewedCard({super.key, required this.coin, this.onTap});

  bool get isPositive => (coin.priceChange24hPercentage ?? 0) >= 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.xl),
      child: Container(
        width: 170,
        padding: AppPaddings.card,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(coin.image, height: 34, width: 34),

                const SizedBox(width: AppSizes.xl),

                Expanded(
                  child: Text(
                    coin.symbol.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            Text(
              '${(coin.priceChange24hPercentage ?? 0).toStringAsFixed(2)}%',
              style: isPositive
                  ? AppTextStyles.percentagePositive
                  : AppTextStyles.percentageNegative,
            ),

            const SizedBox(height: AppSizes.xxs),

            Text(
              '\$${(coin.currentPrice ?? 0).toStringAsFixed(2)}',
              style: AppTextStyles.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
