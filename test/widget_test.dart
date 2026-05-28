import 'package:crypto_insight_dashboard/core/constants/app_strings.dart';
import 'package:crypto_insight_dashboard/modules/dashboard/presentation/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Section title can show a summary action', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SectionTitle(
            title: AppStrings.recentlyViewed,
            trailing: Text(AppStrings.summary),
          ),
        ),
      ),
    );

    expect(find.text(AppStrings.recentlyViewed), findsOneWidget);
    expect(find.text(AppStrings.summary), findsOneWidget);
  });
}
