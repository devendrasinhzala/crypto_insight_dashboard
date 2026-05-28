import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/coin_entity.dart';
import '../../domain/usecases/fetch_coins_usecase.dart';
import '../../domain/usecases/get_cached_coins_usecase.dart';
import '../../../shared/recently_viewed/domain/usecases/get_recently_viewed_coins_usecase.dart';
import '../../../shared/recently_viewed/domain/usecases/save_recently_viewed_coin_usecase.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final FetchCoinsUseCase fetchCoinsUseCase;
  final GetCachedCoinsUseCase getCachedCoinsUseCase;
  final GetRecentlyViewedCoinsUseCase getRecentlyViewedCoinsUseCase;
  final SaveRecentlyViewedCoinUseCase saveRecentlyViewedCoinUseCase;

  final List<CoinEntity> _allCoins = [];
  final List<CoinEntity> _recentlyViewedCoins = [];
  int _currentPage = 1;
  bool _isFetching = false;
  bool _hasMore = true;

  DashboardBloc({
    required this.fetchCoinsUseCase,
    required this.getCachedCoinsUseCase,
    required this.getRecentlyViewedCoinsUseCase,
    required this.saveRecentlyViewedCoinUseCase,
  }) : super(const DashboardState.initial()) {
    on<DashboardEvent>(_onDashboardEvent);
  }

  Future<void> _onDashboardEvent(
    DashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    await event.when(
      fetchCoin: () async {
        if (_isFetching || !_hasMore) {
          return;
        }

        try {
          _isFetching = true;
          if (_currentPage == 1) {
            final recentlyViewed = await getRecentlyViewedCoinsUseCase();
            _recentlyViewedCoins
              ..clear()
              ..addAll(recentlyViewed);
            final cachedCoins = await getCachedCoinsUseCase();
            if (cachedCoins.isNotEmpty) {
              _allCoins
                ..clear()
                ..addAll(cachedCoins);
              emit(
                DashboardState.success(
                  coins: List.unmodifiable(_allCoins),
                  recentlyViewed: List.unmodifiable(_recentlyViewedCoins),
                ),
              );
            } else {
              emit(const DashboardState.loading());
            }
          }

          final coins = await fetchCoinsUseCase(page: _currentPage);
          if (coins.isEmpty) {
            _hasMore = false;
          } else {
            if (_currentPage == 1) {
              _allCoins.clear();
            }
            _allCoins.addAll(coins);
            _currentPage++;
            if (coins.length < AppConstants.pageSize) {
              _hasMore = false;
            }
          }

          emit(
            DashboardState.success(
              coins: List.unmodifiable(_allCoins),
              recentlyViewed: List.unmodifiable(_recentlyViewedCoins),
            ),
          );
        } catch (e) {
          emit(DashboardState.error(message: e.toString()));
        } finally {
          _isFetching = false;
        }
      },

      refreshCoin: () async {
        if (_isFetching) {
          return;
        }

        try {
          _isFetching = true;
          _currentPage = 1;
          _hasMore = true;
          _allCoins.clear();

          emit(const DashboardState.loading());

          final coins = await fetchCoinsUseCase(page: _currentPage);
          _allCoins.addAll(coins);
          _currentPage = 2;
          _hasMore = coins.length >= AppConstants.pageSize;
          final recentlyViewed = await getRecentlyViewedCoinsUseCase();
          _recentlyViewedCoins
            ..clear()
            ..addAll(recentlyViewed);

          emit(
            DashboardState.success(
              coins: List.unmodifiable(_allCoins),
              recentlyViewed: List.unmodifiable(_recentlyViewedCoins),
            ),
          );
        } catch (e) {
          emit(DashboardState.error(message: e.toString()));
        } finally {
          _isFetching = false;
        }
      },

      searchCoin: (query) async {
        try {
          final normalizedQuery = query.trim().toLowerCase();
          if (normalizedQuery.isEmpty) {
            emit(
              DashboardState.success(
                coins: List.unmodifiable(_allCoins),
                recentlyViewed: List.unmodifiable(_recentlyViewedCoins),
              ),
            );
            return;
          }
          final coins = _allCoins
              .where((coin) {
                return coin.name.toLowerCase().contains(normalizedQuery) ||
                    coin.symbol.toLowerCase().contains(normalizedQuery) ||
                    coin.id.toLowerCase().contains(normalizedQuery);
              })
              .toList(growable: false);

          emit(
            DashboardState.success(
              coins: coins,
              recentlyViewed: List.unmodifiable(_recentlyViewedCoins),
            ),
          );
        } catch (e) {
          emit(DashboardState.error(message: e.toString()));
        }
      },

      coinViewed: (coin) async {
        try {
          await saveRecentlyViewedCoinUseCase(coin);
          final recentlyViewed = await getRecentlyViewedCoinsUseCase();
          _recentlyViewedCoins
            ..clear()
            ..addAll(recentlyViewed);

          emit(
            DashboardState.success(
              coins: List.unmodifiable(_allCoins),
              recentlyViewed: List.unmodifiable(_recentlyViewedCoins),
            ),
          );
        } catch (_) {
          // No-op: recently viewed persistence should not break UI flow.
        }
      },
    );
  }
}
