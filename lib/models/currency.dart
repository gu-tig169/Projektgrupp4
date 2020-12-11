class Currency {
  Currency(
      {this.name,
      this.symbol,
      this.priceUsd,
      this.priceBtc,
      this.lastUpdated,
      this.isFavorite,
      this.upperThreshold,
      this.lowerThreshold});

  String name;
  String symbol;
  double priceUsd;
  double priceBtc;
  String lastUpdated;

  bool isFavorite;
  double upperThreshold;
  double lowerThreshold;
}
