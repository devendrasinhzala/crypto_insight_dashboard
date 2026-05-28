// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoinModel _$CoinModelFromJson(Map<String, dynamic> json) => _CoinModel(
  id: json['id'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  symbol: json['symbol'] as String,
  currentPrice: (json['current_price'] as num?)?.toDouble(),
  priceChange24hPercentage: (json['price_change_percentage_24h'] as num?)
      ?.toDouble(),
  marketCapRank: (json['market_cap_rank'] as num?)?.toInt(),
  lastUpdated: json['last_updated'] as String?,
  priceChange24h: (json['price_change_24h'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CoinModelToJson(_CoinModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'symbol': instance.symbol,
      'current_price': instance.currentPrice,
      'price_change_percentage_24h': instance.priceChange24hPercentage,
      'market_cap_rank': instance.marketCapRank,
      'last_updated': instance.lastUpdated,
      'price_change_24h': instance.priceChange24h,
    };
