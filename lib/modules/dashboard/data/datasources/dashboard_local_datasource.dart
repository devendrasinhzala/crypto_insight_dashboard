import 'package:hive_flutter/hive_flutter.dart';

import '../models/coin_model.dart';

abstract class DashboardLocalDataSource {
  Future<List<CoinModel>> getCachedCoins();
  Future<void> cacheCoins({required List<CoinModel> coins, required int page});
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  DashboardLocalDataSourceImpl(this._box);

  static const String coinsKey = 'coins';

  final Box<dynamic> _box;

  @override
  Future<List<CoinModel>> getCachedCoins() async {
    return _readCoinsList(coinsKey);
  }

  @override
  Future<void> cacheCoins({
    required List<CoinModel> coins,
    required int page,
  }) async {
    if (page <= 1) {
      await _box.put(
        coinsKey,
        coins.map((coin) => coin.toJson()).toList(growable: false),
      );
      return;
    }

    final current = await getCachedCoins();
    final merged = <String, CoinModel>{
      for (final coin in current) coin.id: coin,
      for (final coin in coins) coin.id: coin,
    }.values.toList(growable: false);

    await _box.put(
      coinsKey,
      merged.map((coin) => coin.toJson()).toList(growable: false),
    );
  }

  List<CoinModel> _readCoinsList(String key) {
    final raw = _box.get(key);
    if (raw is! List) {
      return <CoinModel>[];
    }

    return raw
        .whereType<Map>()
        .map((map) => map.map((k, v) => MapEntry(k.toString(), v)))
        .map(CoinModel.fromJson)
        .toList(growable: false);
  }
}
