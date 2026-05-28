import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/coin_entity.dart';

part 'coin_model.freezed.dart';
part 'coin_model.g.dart';

@freezed
abstract class CoinModel with _$CoinModel implements CoinEntity {
  const factory CoinModel({
    required String id,
    required String name,
    required String image,
    required String symbol,
    @JsonKey(name: 'current_price') double? currentPrice,
    @JsonKey(name: 'price_change_percentage_24h')
    double? priceChange24hPercentage,
    @JsonKey(name: 'market_cap_rank')
    int? marketCapRank,
    @JsonKey(name: 'last_updated')
    String? lastUpdated,
    @JsonKey(name: 'price_change_24h')
    double? priceChange24h,
  }) = _CoinModel;

  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);
}
