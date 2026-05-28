import 'package:flutter/material.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'wallet_action_button.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.card,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.secondary, AppColors.primary],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(AppStrings.myWallet, style: AppTextStyles.whiteMedium),

              const Spacer(),

              Container(
                padding: AppPaddings.badge,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                child: Row(
                  children: const [
                    Text(
                      AppStrings.usd,
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: AppSizes.xxs),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSizes.bottomSpace),

          Text('\$8,540.00', style: AppTextStyles.walletAmount),

          const SizedBox(height: AppSizes.bottomSpace),

          Row(
            children: const [
              Expanded(
                child: WalletActionButton(
                  title: AppStrings.transfer,
                  icon: Icons.north_east_rounded,
                ),
              ),
              SizedBox(width: AppSizes.md),
              Expanded(
                child: WalletActionButton(
                  title: AppStrings.deposit,
                  icon: Icons.south_west_rounded,
                ),
              ),
              SizedBox(width: AppSizes.md),
              Expanded(
                child: WalletActionButton(
                  title: AppStrings.swap,
                  icon: Icons.swap_horiz_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
