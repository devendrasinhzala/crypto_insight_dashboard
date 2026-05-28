import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../bloc/coin_details_cubit.dart';
import '../widgets/details_content.dart';

class CoinDetailsScreen extends StatefulWidget {
  const CoinDetailsScreen({required this.coinId, super.key});

  final String coinId;

  @override
  State<CoinDetailsScreen> createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends State<CoinDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CoinDetailsCubit>().fetchDetails(widget.coinId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: AppPaddings.screenHorizontal,
              child: SizedBox(
                height: 72,
                child: Row(
                  children: [
                    _HeaderIconButton(
                      icon: AppImages.back,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: AppSizes.md),
                    Text(AppStrings.details, style: AppTextStyles.heading3),
                    const Spacer(),
                    _HeaderIconButton(icon: AppImages.favorite, onTap: () {}),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CoinDetailsCubit, CoinDetailsState>(
                builder: (context, state) {
                  switch (state.status) {
                    case CoinDetailsStatus.initial:
                    case CoinDetailsStatus.loading:
                      return const Center(child: CircularProgressIndicator());
                    case CoinDetailsStatus.error:
                      return Center(
                        child: Text(state.message ?? 'Failed to load details'),
                      );
                    case CoinDetailsStatus.success:
                      final details = state.details;
                      if (details == null) {
                        return const Center(child: Text('No details found'));
                      }
                      return DetailsContent(details: details);
                  }
                },
              ),
            ),
            const _TradeActionBar(),
          ],
        ),
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({required this.icon, required this.onTap});

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Image.asset(icon, height: 52, width: 52),
    );
  }
}

class _TradeActionBar extends StatelessWidget {
  const _TradeActionBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.black.withValues(alpha: 0.06)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: _TradeButton(
                label: 'Buy',
                color: AppColors.green,
                onTap: () {},
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _TradeButton(
                label: 'Sell',
                color: AppColors.red,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TradeButton extends StatelessWidget {
  const _TradeButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 49,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          label,
          style: AppTextStyles.whiteMedium.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
