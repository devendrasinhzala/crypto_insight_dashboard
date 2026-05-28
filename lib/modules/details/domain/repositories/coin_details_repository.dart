import '../entities/coin_details_entity.dart';

abstract class CoinDetailsRepository {
  Future<CoinDetailsEntity> fetchCoinDetails({required String id});
}

