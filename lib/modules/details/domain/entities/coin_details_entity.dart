class CoinDetailsEntity {
  const CoinDetailsEntity({
    this.id,
    this.name,
    this.symbol,
    this.image,
    this.description,
    this.categories,
    this.currentPrice,
    this.marketCapRank,
    this.marketCap,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.ath,
    this.atl,
    this.circulatingSupply,
    this.maxSupply,
    this.priceChangePercentage7d,
    this.priceChangePercentage30d,
    this.sparklineInUsd,
    this.websiteUrl,
    this.whitepaperUrl,
  });

  final String? id;
  final String? name;
  final String? symbol;
  final String? image;
  final String? description;
  final List<String>? categories;

  final double? currentPrice;
  final int? marketCapRank;
  final double? marketCap;
  final double? totalVolume;
  final double? high24h;
  final double? low24h;
  final double? ath;
  final double? atl;
  final double? circulatingSupply;
  final double? maxSupply;
  final double? priceChangePercentage7d;
  final double? priceChangePercentage30d;
  final List<double>? sparklineInUsd;
  final String? websiteUrl;
  final String? whitepaperUrl;

}

