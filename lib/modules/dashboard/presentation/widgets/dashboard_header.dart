import 'package:flutter/material.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_colors.dart';
import 'search_field.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    required this.searchController,
    required this.onSearchChanged,
    required this.isSearchVisible,
    required this.onSearchTap,
    super.key,
  });

  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final bool isSearchVisible;
  final VoidCallback onSearchTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.md),
            image: const DecorationImage(
              image: AssetImage(AppImages.profile),
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(width: AppSizes.lg),

        if (isSearchVisible)
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SearchField(
                    controller: searchController,
                    onChanged: onSearchChanged,
                  ),
                ),
                const SizedBox(width: AppSizes.sm),
                InkWell(
                  onTap: onSearchTap,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: const Center(
                      child: Icon(Icons.close, color: AppColors.black),
                    ),
                  ),
                ),
              ],
            ),
          )
        else ...[
          const Spacer(),
          InkWell(
            onTap: onSearchTap,
            borderRadius: BorderRadius.circular(AppRadius.sm),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.md),
              child: Image.asset(AppImages.search),
            ),
          ),

          const SizedBox(width: AppSizes.sm),

          Image(image: AssetImage(AppImages.notification)),
        ],
      ],
    );
  }
}
