import 'package:hive_flutter/hive_flutter.dart';

import '../../../../dashboard/data/models/coin_model.dart';

abstract class RecentlyViewedLocalDataSource {
  Future<List<CoinModel>> getRecentlyViewedCoins();
  Future<void> saveRecentlyViewedCoin(CoinModel coin);
}

class RecentlyViewedLocalDataSourceImpl
    implements RecentlyViewedLocalDataSource {
  RecentlyViewedLocalDataSourceImpl(this._box);

  static const String recentlyViewedKey = 'recently_viewed_coins';
  static const int recentlyViewedLimit = 10;

  final Box<dynamic> _box;

  @override
  Future<List<CoinModel>> getRecentlyViewedCoins() async {
    final raw = _box.get(recentlyViewedKey);
    if (raw is! List) {
      return <CoinModel>[];
    }

    return raw
        .whereType<Map>()
        .map((map) => map.map((k, v) => MapEntry(k.toString(), v)))
        .map(CoinModel.fromJson)
        .toList(growable: false);
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
}

