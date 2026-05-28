import '../../../dashboard/domain/entities/coin_entity.dart';
import '../../../shared/recently_viewed/domain/usecases/get_recently_viewed_coins_usecase.dart';
import '../../data/models/viewed_coins_summary_model.dart';

class GetViewedCoinsSummaryUseCase {
  const GetViewedCoinsSummaryUseCase(this._getRecentlyViewedCoinsUseCase);

  final GetRecentlyViewedCoinsUseCase _getRecentlyViewedCoinsUseCase;

  Future<ViewedCoinsSummaryModel?> call() async {
    final coins = await _getRecentlyViewedCoinsUseCase();
    if (coins.length < 3) {
      return null;
    }

    final coinsWithPrice = coins.where((coin) => coin.currentPrice != null);
    final averagePrice = coinsWithPrice.isEmpty
        ? 0.0
        : coinsWithPrice
                  .map((coin) => coin.currentPrice!)
                  .reduce((value, element) => value + element) /
              coinsWithPrice.length;

    final rankedCoins = [...coins]
      ..sort((a, b) => _performanceOf(b).compareTo(_performanceOf(a)));

    return ViewedCoinsSummaryModel(
      viewedCount: coins.length,
      averagePrice: averagePrice,
      bestPerformer: rankedCoins.first,
      worstPerformer: rankedCoins.last,
    );
  }

  double _performanceOf(CoinEntity coin) {
    return coin.priceChange24hPercentage ?? coin.priceChange24h ?? 0;
  }
}
