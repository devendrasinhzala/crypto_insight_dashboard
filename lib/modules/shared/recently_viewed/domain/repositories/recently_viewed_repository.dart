import '../../../../dashboard/domain/entities/coin_entity.dart';

abstract class RecentlyViewedRepository {
  Future<List<CoinEntity>> getRecentlyViewedCoins();
  Future<void> saveRecentlyViewedCoin(CoinEntity coin);
}

