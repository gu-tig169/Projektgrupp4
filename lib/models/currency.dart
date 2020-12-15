class Currency {
  Currency(
      {this.name,
      this.symbol,
      this.priceUsd,
      this.priceBtc,
      this.lastUpdated,
      this.percentChange24Usd,
      this.isFavorite = false,
      this.upperThreshold,
      this.lowerThreshold});

  String name;
  String symbol;
  double priceUsd;
  double priceBtc;
  String lastUpdated;
  String percentChange24Usd;

  bool isFavorite;
  double upperThreshold;
  double lowerThreshold;
}
