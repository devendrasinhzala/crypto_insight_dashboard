import '../../domain/entities/coin_details_entity.dart';
import '../../domain/repositories/coin_details_repository.dart';
import '../datasources/coin_details_remote_datasource.dart';

class CoinDetailsRepositoryImpl implements CoinDetailsRepository {
  CoinDetailsRepositoryImpl(this._remoteDataSource);

  final CoinDetailsRemoteDataSource _remoteDataSource;

  @override
  Future<CoinDetailsEntity> fetchCoinDetails({required String id}) {
    return _remoteDataSource.fetchCoinDetails(id: id);
  }
}

