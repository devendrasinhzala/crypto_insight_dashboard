// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoinDetailsModel _$CoinDetailsModelFromJson(Map<String, dynamic> json) =>
    _CoinDetailsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      currentPrice: (json['currentPrice'] as num?)?.toDouble(),
      marketCapRank: (json['marketCapRank'] as num?)?.toInt(),
      marketCap: (json['marketCap'] as num?)?.toDouble(),
      totalVolume: (json['totalVolume'] as num?)?.toDouble(),
      high24h: (json['high24h'] as num?)?.toDouble(),
      low24h: (json['low24h'] as num?)?.toDouble(),
      ath: (json['ath'] as num?)?.toDouble(),
      atl: (json['atl'] as num?)?.toDouble(),
      circulatingSupply: (json['circulatingSupply'] as num?)?.toDouble(),
      maxSupply: (json['maxSupply'] as num?)?.toDouble(),
      priceChangePercentage7d: (json['priceChangePercentage7d'] as num?)
          ?.toDouble(),
      priceChangePercentage30d: (json['priceChangePercentage30d'] as num?)
          ?.toDouble(),
      sparklineInUsd: (json['sparklineInUsd'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      websiteUrl: json['websiteUrl'] as String?,
      whitepaperUrl: json['whitepaperUrl'] as String?,
    );

Map<String, dynamic> _$CoinDetailsModelToJson(_CoinDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'image': instance.image,
      'description': instance.description,
      'categories': instance.categories,
      'currentPrice': instance.currentPrice,
      'marketCapRank': instance.marketCapRank,
      'marketCap': instance.marketCap,
      'totalVolume': instance.totalVolume,
      'high24h': instance.high24h,
      'low24h': instance.low24h,
      'ath': instance.ath,
      'atl': instance.atl,
      'circulatingSupply': instance.circulatingSupply,
      'maxSupply': instance.maxSupply,
      'priceChangePercentage7d': instance.priceChangePercentage7d,
      'priceChangePercentage30d': instance.priceChangePercentage30d,
      'sparklineInUsd': instance.sparklineInUsd,
      'websiteUrl': instance.websiteUrl,
      'whitepaperUrl': instance.whitepaperUrl,
    };
