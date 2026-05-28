import '../entities/coin_entity.dart';

abstract class DashboardRepository {
  Future<List<CoinEntity>> fetchCoins({required int page});
  Future<List<CoinEntity>> getCachedCoins();
}
