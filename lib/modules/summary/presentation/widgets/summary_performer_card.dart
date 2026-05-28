import 'package:flutter/material.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../dashboard/domain/entities/coin_entity.dart';

class SummaryPerformerCard extends StatelessWidget {
  const SummaryPerformerCard({
    super.key,
    required this.title,
    required this.coin,
  });

  final String title;
  final CoinEntity coin;

  bool get _isPositive => (coin.priceChange24hPercentage ?? 0) >= 0;

  @override
  Widget build(BuildContext context) {
    final percentage = coin.priceChange24hPercentage ?? 0;

    return Container(
      padding: AppPaddings.card,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Row(
        children: [
          Image.network(coin.image, height: 44, width: 44),
          const SizedBox(width: AppSizes.xl),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodySmall),
                const SizedBox(height: AppSizes.xs),
                Text(
                  coin.name,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.md),
          Text(
            '${percentage.toStringAsFixed(2)}%',
            style: _isPositive
                ? AppTextStyles.percentagePositive
                : AppTextStyles.percentageNegative,
          ),
        ],
      ),
    );
  }
}
