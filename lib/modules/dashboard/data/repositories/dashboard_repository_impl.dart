import '../../domain/entities/coin_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_local_datasource.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../models/coin_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  final DashboardRemoteDataSource _remoteDataSource;
  final DashboardLocalDataSource _localDataSource;

  @override
  Future<List<CoinEntity>> fetchCoins({required int page}) async {
    final remoteCoins = await _remoteDataSource.fetchCoins(page: page);
    await _localDataSource.cacheCoins(
      coins: remoteCoins,
      page: page,
    );
    return remoteCoins;
  }

  @override
  Future<List<CoinEntity>> getCachedCoins() async {
    final cached = await _localDataSource.getCachedCoins();
    return cached.cast<CoinModel>();
  }

  @override
  Future<List<CoinEntity>> getRecentlyViewedCoins() async {
    final recentlyViewed = await _localDataSource.getRecentlyViewedCoins();
    return recentlyViewed.cast<CoinModel>();
  }

  @override
  Future<void> saveRecentlyViewedCoin(CoinEntity coin) async {
    if (coin is CoinModel) {
      await _localDataSource.saveRecentlyViewedCoin(coin);
      return;
    }

    final model = CoinModel(
      id: coin.id,
      name: coin.name,
      image: coin.image,
      symbol: coin.symbol,
      currentPrice: coin.currentPrice,
      priceChange24hPercentage: coin.priceChange24hPercentage,
      marketCapRank: coin.marketCapRank,
      lastUpdated: coin.lastUpdated,
      priceChange24h: coin.priceChange24h,
    );
    await _localDataSource.saveRecentlyViewedCoin(model);
  }
}
