import '../../../../dashboard/data/models/coin_model.dart';
import '../../../../dashboard/domain/entities/coin_entity.dart';
import '../../domain/repositories/recently_viewed_repository.dart';
import '../datasources/recently_viewed_local_datasource.dart';

class RecentlyViewedRepositoryImpl implements RecentlyViewedRepository {
  RecentlyViewedRepositoryImpl(this._localDataSource);

  final RecentlyViewedLocalDataSource _localDataSource;

  @override
  Future<List<CoinEntity>> getRecentlyViewedCoins() async {
    final coins = await _localDataSource.getRecentlyViewedCoins();
    return coins.cast<CoinModel>();
  }

  @override
  Future<void> saveRecentlyViewedCoin(CoinEntity coin) async {
    if (coin is CoinModel) {
      await _localDataSource.saveRecentlyViewedCoin(coin);
      return;
    }

    await _localDataSource.saveRecentlyViewedCoin(
      CoinModel(
        id: coin.id,
        name: coin.name,
        image: coin.image,
        symbol: coin.symbol,
        currentPrice: coin.currentPrice,
        priceChange24hPercentage: coin.priceChange24hPercentage,
        marketCapRank: coin.marketCapRank,
        lastUpdated: coin.lastUpdated,
        priceChange24h: coin.priceChange24h,
      ),
    );
  }
}

