import 'package:flutter/material.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class WalletActionButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const WalletActionButton({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.actionButtonVertical,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.white, size: 18),
          const SizedBox(width: 6),
          Text(
            title,
            style: AppTextStyles.whiteMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
