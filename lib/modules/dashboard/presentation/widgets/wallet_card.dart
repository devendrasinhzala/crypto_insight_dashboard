import 'package:flutter/material.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/app_images.dart';
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
        gradient: const RadialGradient(
          center: Alignment.center,
          radius: -0.3,
          transform: GradientRotation(20),
          stops: [0.0, 1],
          focal: AlignmentGeometry.center,
          focalRadius: 1,
          colors: [AppColors.primary, AppColors.secondary],
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
                  children: [
                    Text(
                      AppStrings.usd,
                      style: AppTextStyles.whiteMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: AppSizes.xxs),
                    const Icon(
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
                  icon: AppImages.moneySend,
                ),
              ),
              SizedBox(width: AppSizes.md),
              Expanded(
                child: WalletActionButton(
                  title: AppStrings.deposit,
                  icon: AppImages.moneyReceive,
                ),
              ),
              SizedBox(width: AppSizes.md),
              Expanded(
                child: WalletActionButton(
                  title: AppStrings.swap,
                  icon: AppImages.bitcoinConvert,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
