import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/summary_cubit.dart';
import '../cubit/summary_state.dart';
import '../widgets/summary_metric_card.dart';
import '../widgets/summary_performer_card.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(symbol: r'$');

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text(AppStrings.summary),
        backgroundColor: AppColors.scaffoldBackground,
      ),
      body: SafeArea(
        child: BlocBuilder<SummaryCubit, SummaryState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const Center(child: CircularProgressIndicator()),
              insufficientData: () => Center(
                child: Padding(
                  padding: AppPaddings.screenHorizontal,
                  child: Text(
                    AppStrings.summaryNeedsMoreCoins,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyMedium,
                  ),
                ),
              ),
              error: (message) => Center(child: Text(message)),
              success: (summary) {
                return ListView(
                  padding: const EdgeInsets.all(AppSizes.pageHorizontal),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      AppStrings.viewedCoinsSummary,
                      style: AppTextStyles.heading2,
                    ),
                    const SizedBox(height: AppSizes.xs),
                    Text(
                      '${summary.viewedCount} ${AppStrings.coinsViewed}',
                      style: AppTextStyles.bodyMedium,
                    ),
                    const SizedBox(height: AppSizes.sectionGap),
                    SummaryMetricCard(
                      title: AppStrings.averagePrice,
                      value: currencyFormat.format(summary.averagePrice),
                    ),
                    const SizedBox(height: AppSizes.xl),
                    SummaryPerformerCard(
                      title: AppStrings.bestPerformer,
                      coin: summary.bestPerformer,
                    ),
                    const SizedBox(height: AppSizes.xl),
                    SummaryPerformerCard(
                      title: AppStrings.worstPerformer,
                      coin: summary.worstPerformer,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
