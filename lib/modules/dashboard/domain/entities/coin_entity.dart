class CoinEntity {
  const CoinEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.symbol,
    this.currentPrice,
    this.priceChange24hPercentage,
    this.marketCapRank,
    this.lastUpdated,
    this.priceChange24h,
  });

  final String id;
  final String name;
  final String image;
  final String symbol;
  final double? currentPrice;
  final double? priceChange24hPercentage;
  final int? marketCapRank;
  final String? lastUpdated;
  final double? priceChange24h;

}
