import 'package:hive_flutter/hive_flutter.dart';

import '../models/coin_model.dart';

abstract class DashboardLocalDataSource {
  Future<List<CoinModel>> getCachedCoins();
  Future<List<CoinModel>> getRecentlyViewedCoins();
  Future<void> cacheCoins({
    required List<CoinModel> coins,
    required int page,
  });
  Future<void> saveRecentlyViewedCoin(CoinModel coin);
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  DashboardLocalDataSourceImpl(this._box);

  static const String coinsKey = 'coins';
  static const String recentlyViewedKey = 'recently_viewed_coins';
  static const int recentlyViewedLimit = 10;

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

  @override
  Future<List<CoinModel>> getRecentlyViewedCoins() async {
    return _readCoinsList(recentlyViewedKey);
  }

  @override
  Future<void> saveRecentlyViewedCoin(CoinModel coin) async {
    final current = await getRecentlyViewedCoins();
    final updated = <CoinModel>[
      coin,
      ...current.where((item) => item.id != coin.id),
    ];

    await _box.put(
      recentlyViewedKey,
      updated
          .take(recentlyViewedLimit)
          .map((item) => item.toJson())
          .toList(growable: false),
    );
  }

  List<CoinModel> _readCoinsList(String key) {
    final raw = _box.get(key);
    if (raw is! List) {
      return <CoinModel>[];
    }

    return raw
        .whereType<Map>()
        .map((map) => map.map(
              (k, v) => MapEntry(k.toString(), v),
            ))
        .map(CoinModel.fromJson)
        .toList(growable: false);
  }
}

