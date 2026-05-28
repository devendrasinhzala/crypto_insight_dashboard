import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/coin_details_entity.dart';

part 'coin_details_model.freezed.dart';
part 'coin_details_model.g.dart';

@freezed
abstract class CoinDetailsModel
    with _$CoinDetailsModel
    implements CoinDetailsEntity {
  const factory CoinDetailsModel({
    String? id,
    String? name,
    String? symbol,
    String? image,
    String? description,
    List<String>? categories,
    double? currentPrice,
    int? marketCapRank,
    double? marketCap,
    double? totalVolume,
    double? high24h,
    double? low24h,
    double? ath,
    double? atl,
    double? circulatingSupply,
    double? maxSupply,
    double? priceChangePercentage7d,
    double? priceChangePercentage30d,
    List<double>? sparklineInUsd,
    String? websiteUrl,
    String? whitepaperUrl,
  }) = _CoinDetailsModel;

  factory CoinDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailsModelFromJson(json);

  factory CoinDetailsModel.fromApiJson(Map<String, dynamic> json) {
    final flattened = _flattenApiJson(json);
    return CoinDetailsModel.fromJson(flattened);
  }

  static Map<String, dynamic> _flattenApiJson(Map<String, dynamic> json) {
    final marketData = _map(json['market_data']);
    final imageData = _map(json['image']);
    final links = _map(json['links']);
    final descriptionData = _map(json['description']);

    return <String, dynamic>{
      'id': _stringOrNull(json['id']),
      'name': _stringOrNull(json['name']),
      'symbol': _stringOrNull(json['symbol']),
      'image': _stringOrNull(imageData['large']),
      'description': _stringOrNull(descriptionData['en']),
      'categories': _stringList(json['categories']),
      'currentPrice': _double(_map(marketData['current_price'])['usd']),
      'marketCapRank': _int(json['market_cap_rank']),
      'marketCap': _double(_map(marketData['market_cap'])['usd']),
      'totalVolume': _double(_map(marketData['total_volume'])['usd']),
      'high24h': _double(_map(marketData['high_24h'])['usd']),
      'low24h': _double(_map(marketData['low_24h'])['usd']),
      'ath': _double(_map(marketData['ath'])['usd']),
      'atl': _double(_map(marketData['atl'])['usd']),
      'circulatingSupply': _double(marketData['circulating_supply']),
      'maxSupply': _double(marketData['max_supply']),
      'priceChangePercentage7d': _double(
        marketData['price_change_percentage_7d'],
      ),
      'priceChangePercentage30d': _double(
        marketData['price_change_percentage_30d'],
      ),
      'sparklineInUsd': _doubleList(_map(marketData['sparkline_7d'])['price']),
      'websiteUrl': _firstString(links['homepage']),
      'whitepaperUrl': _stringOrNull(links['whitepaper']),
    };
  }

  static Map<String, dynamic> _map(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value;
    }
    if (value is Map) {
      return value.map((key, val) => MapEntry(key.toString(), val));
    }
    return <String, dynamic>{};
  }

  static String? _stringOrNull(dynamic value) {
    final raw = value?.toString();
    if (raw == null || raw.isEmpty) {
      return null;
    }
    return raw;
  }

  static double? _double(dynamic value) {
    if (value is num) {
      return value.toDouble();
    }
    if (value is String) {
      return double.tryParse(value);
    }
    return null;
  }

  static int? _int(dynamic value) {
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }

  static List<String> _stringList(dynamic value) {
    if (value is List) {
      return value.map((item) => item.toString()).toList(growable: false);
    }
    return <String>[];
  }

  static List<double> _doubleList(dynamic value) {
    if (value is List) {
      return value.map(_double).whereType<double>().toList(growable: false);
    }
    return <double>[];
  }

  static String? _firstString(dynamic value) {
    if (value is List && value.isNotEmpty) {
      final first = value.first?.toString();
      if (first != null && first.isNotEmpty) {
        return first;
      }
    }
    return null;
  }
}
