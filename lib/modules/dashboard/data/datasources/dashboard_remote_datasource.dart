import '../../../../core/constants/app_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/endpoints.dart';
import '../models/coin_model.dart';

abstract class DashboardRemoteDataSource {
  Future<List<CoinModel>> fetchCoins({required int page});
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  DashboardRemoteDataSourceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<List<CoinModel>> fetchCoins({required int page}) async {
    final response = await _apiClient.get<List<dynamic>>(
      Endpoints.coinsMarkets,
      queryParameters: <String, dynamic>{
        'vs_currency': 'usd',
        'per_page': AppConstants.pageSize,
        'page': page,
      },
    );

    final data = response.data ?? <dynamic>[];

    return data
        .whereType<Map<String, dynamic>>()
        .map(CoinModel.fromJson)
        .toList(growable: false);
  }
}

