import '../../../../dashboard/domain/entities/coin_entity.dart';
import '../repositories/recently_viewed_repository.dart';

class SaveRecentlyViewedCoinUseCase {
  const SaveRecentlyViewedCoinUseCase(this._repository);

  final RecentlyViewedRepository _repository;

  Future<void> call(CoinEntity coin) {
    return _repository.saveRecentlyViewedCoin(coin);
  }
}
