import 'package:flutter/widgets.dart';

import 'app_sizes.dart';

class AppPaddings {
  const AppPaddings._();

  static const EdgeInsets screenHorizontal = EdgeInsets.symmetric(
    horizontal: AppSizes.pageHorizontal,
  );
  static const EdgeInsets card = EdgeInsets.all(AppSizes.xxl);
  static const EdgeInsets actionButtonVertical = EdgeInsets.symmetric(
    vertical: AppSizes.lg,
  );
  static const EdgeInsets badge = EdgeInsets.symmetric(
    horizontal: AppSizes.md,
    vertical: AppSizes.xs,
  );
}

