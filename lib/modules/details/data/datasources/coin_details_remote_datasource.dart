import '../../../../core/network/api_client.dart';
import '../models/coin_details_model.dart';

abstract class CoinDetailsRemoteDataSource {
  Future<CoinDetailsModel> fetchCoinDetails({required String id});
}

class CoinDetailsRemoteDataSourceImpl implements CoinDetailsRemoteDataSource {
  CoinDetailsRemoteDataSourceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<CoinDetailsModel> fetchCoinDetails({required String id}) async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      '/coins/$id',
      queryParameters: <String, dynamic>{
        'localization': false,
        'tickers': false,
        'market_data': true,
        'community_data': false,
        'developer_data': false,
        'sparkline': true,
      },
    );

    final data = response.data ?? <String, dynamic>{};
    return CoinDetailsModel.fromApiJson(data);
  }
}

