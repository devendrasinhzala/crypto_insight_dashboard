import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import 'details_section_card.dart';

class DetailsMetricGrid extends StatelessWidget {
  const DetailsMetricGrid({
    required this.title,
    required this.children,
    super.key,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DetailsSectionCard(
      title: title,
      child: Wrap(
        spacing: AppSizes.xl,
        runSpacing: AppSizes.lg,
        children: children
            .map(
              (child) => SizedBox(
                width: (MediaQuery.of(context).size.width - 88) / 2,
                child: child,
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}

