import '../entities/coin_entity.dart';
import '../repositories/dashboard_repository.dart';

class GetCachedCoinsUseCase {
  const GetCachedCoinsUseCase(this._repository);

  final DashboardRepository _repository;

  Future<List<CoinEntity>> call() {
    return _repository.getCachedCoins();
  }
}

