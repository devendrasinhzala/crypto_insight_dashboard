import '../entities/coin_entity.dart';
import '../repositories/dashboard_repository.dart';

class FetchCoinsUseCase {
  const FetchCoinsUseCase(this._repository);

  final DashboardRepository _repository;

  Future<List<CoinEntity>> call({required int page}) {
    return _repository.fetchCoins(page: page);
  }
}

