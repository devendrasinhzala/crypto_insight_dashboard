import '../entities/coin_entity.dart';
import '../repositories/dashboard_repository.dart';

class SaveRecentlyViewedCoinUseCase {
  const SaveRecentlyViewedCoinUseCase(this._repository);

  final DashboardRepository _repository;

  Future<void> call(CoinEntity coin) {
    return _repository.saveRecentlyViewedCoin(coin);
  }
}

