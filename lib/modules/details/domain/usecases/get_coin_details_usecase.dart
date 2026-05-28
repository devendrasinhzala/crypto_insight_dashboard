import '../entities/coin_details_entity.dart';
import '../repositories/coin_details_repository.dart';

class GetCoinDetailsUseCase {
  const GetCoinDetailsUseCase(this._repository);

  final CoinDetailsRepository _repository;

  Future<CoinDetailsEntity> call({required String id}) {
    return _repository.fetchCoinDetails(id: id);
  }
}

