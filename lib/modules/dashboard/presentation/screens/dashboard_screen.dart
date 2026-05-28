import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/navigation/app_router.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/recently_viewed_card.dart';
import '../widgets/section_title.dart';
import '../widgets/trending_coin_tile.dart';
import '../widgets/wallet_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final ScrollController _scrollController;
  late final TextEditingController _searchController;
  bool _isSearchVisible = false;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _searchController = TextEditingController();

    context.read<DashboardBloc>().add(const DashboardEvent.fetchCoin());

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      context.read<DashboardBloc>().add(const DashboardEvent.fetchCoin());
    }
  }

  Future<void> _onRefresh() async {
    context.read<DashboardBloc>().add(const DashboardEvent.refreshCoin());
  }

  void _toggleSearchVisibility() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
    });
    if (!_isSearchVisible) {
      _searchController.clear();
      context.read<DashboardBloc>().add(
        const DashboardEvent.searchCoin(query: ''),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),

              loading: () => const Center(child: CircularProgressIndicator()),

              error: (message) => Center(child: Text(message)),

              success: (coins, recentlyViewed) {
                return RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: _onRefresh,
                  child: CustomScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    slivers: [
                      const SliverToBoxAdapter(
                        child: SizedBox(height: AppSizes.xxxl),
                      ),

                      /// HEADER
                      SliverPadding(
                        padding: AppPaddings.screenHorizontal,
                        sliver: SliverToBoxAdapter(
                          child: DashboardHeader(
                            searchController: _searchController,
                            onSearchChanged: (value) {
                              context.read<DashboardBloc>().add(
                                DashboardEvent.searchCoin(query: value),
                              );
                            },
                            isSearchVisible: _isSearchVisible,
                            onSearchTap: _toggleSearchVisibility,
                          ),
                        ),
                      ),

                      const SliverToBoxAdapter(
                        child: SizedBox(height: AppSizes.sectionGap),
                      ),

                      /// WALLET CARD
                      const SliverPadding(
                        padding: AppPaddings.screenHorizontal,
                        sliver: SliverToBoxAdapter(child: WalletCard()),
                      ),

                      const SliverToBoxAdapter(
                        child: SizedBox(height: AppSizes.sectionGap),
                      ),

                      if (recentlyViewed.isNotEmpty)
                        SliverPadding(
                          padding: AppPaddings.screenHorizontal,
                          sliver: SliverToBoxAdapter(
                            child: SectionTitle(
                              title: AppStrings.recentlyViewed,
                              trailing: recentlyViewed.length >= 3
                                  ? TextButton(
                                      onPressed: () {
                                        const SummaryRouteData().push(context);
                                      },
                                      child: const Text(AppStrings.summary),
                                    )
                                  : null,
                            ),
                          ),
                        ),

                      if (recentlyViewed.isNotEmpty)
                        const SliverToBoxAdapter(
                          child: SizedBox(height: AppSizes.xxl),
                        ),

                      if (recentlyViewed.isNotEmpty)
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 115,
                            child: ListView.separated(
                              padding: AppPaddings.screenHorizontal,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final coin = recentlyViewed[index];

                                return RecentlyViewedCard(
                                  coin: coin,
                                  onTap: () {
                                    context.read<DashboardBloc>().add(
                                      DashboardEvent.coinViewed(coin: coin),
                                    );
                                    CoinDetailsRouteData(
                                      id: coin.id,
                                    ).push(context);
                                  },
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 16),
                              itemCount: recentlyViewed.length > 5
                                  ? 5
                                  : recentlyViewed.length,
                            ),
                          ),
                        ),

                      const SliverToBoxAdapter(
                        child: SizedBox(height: AppSizes.sectionGap),
                      ),

                      /// TRENDING TITLE
                      const SliverPadding(
                        padding: AppPaddings.screenHorizontal,
                        sliver: SliverToBoxAdapter(
                          child: SectionTitle(title: AppStrings.trending),
                        ),
                      ),

                      const SliverToBoxAdapter(
                        child: SizedBox(height: AppSizes.xxl),
                      ),

                      /// TRENDING LIST
                      SliverPadding(
                        padding: AppPaddings.screenHorizontal,
                        sliver: SliverList.separated(
                          itemBuilder: (context, index) {
                            final coin = coins[index];

                            return TrendingCoinTile(
                              coin: coin,
                              onTap: () {
                                context.read<DashboardBloc>().add(
                                  DashboardEvent.coinViewed(coin: coin),
                                );
                                CoinDetailsRouteData(id: coin.id).push(context);
                              },
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                          itemCount: coins.length,
                        ),
                      ),

                      const SliverToBoxAdapter(
                        child: SizedBox(height: AppSizes.bottomSpace),
                      ),

                      /// BOTTOM LOADER
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: AppSizes.bottomSpace,
                          ),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
