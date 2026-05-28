import '../../../../dashboard/domain/entities/coin_entity.dart';
import '../repositories/recently_viewed_repository.dart';

class GetRecentlyViewedCoinsUseCase {
  const GetRecentlyViewedCoinsUseCase(this._repository);

  final RecentlyViewedRepository _repository;

  Future<List<CoinEntity>> call() {
    return _repository.getRecentlyViewedCoins();
  }
}

