import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/theme/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void _onTabSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    const icons = <String>[
      AppImages.home,
      AppImages.wallet,
      AppImages.trades,
      AppImages.portfolio,
    ];

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(
          AppSizes.xl,
          AppSizes.sm,
          AppSizes.xl,
          AppSizes.sm,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.bottomNavBorder)),
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var index = 0; index < icons.length; index++)
                _BottomNavItem(
                  iconPath: icons[index],
                  isSelected: navigationShell.currentIndex == index,
                  onTap: () => _onTabSelected(index),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 48,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: AppSizes.xs,
              height: AppSizes.xs,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.transparent,
                shape: BoxShape.circle,
              ),
            ),
            Image.asset(
              iconPath,
              color: isSelected
                  ? AppColors.primary
                  : AppColors.bottomNavUnselected,
            ),
          ],
        ),
      ),
    );
  }
}
