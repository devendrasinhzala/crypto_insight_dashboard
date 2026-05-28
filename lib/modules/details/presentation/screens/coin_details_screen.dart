import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Image.asset(AppImages.back),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset(AppImages.favorite)),
        ],
        title: const Text(AppStrings.details),
      ),
      body: BlocBuilder<CoinDetailsCubit, CoinDetailsState>(
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
    );
  }
}
