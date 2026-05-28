import '../entities/coin_entity.dart';
import '../repositories/dashboard_repository.dart';

class GetRecentlyViewedCoinsUseCase {
  const GetRecentlyViewedCoinsUseCase(this._repository);

  final DashboardRepository _repository;

  Future<List<CoinEntity>> call() {
    return _repository.getRecentlyViewedCoins();
  }
}

