import 'package:flutter/foundation.dart';

class Currency {
  Currency(
      {@required this.name,
      @required this.symbol,
      @required this.priceUsd,
      @required this.priceBtc,
      @required this.lastUpdated,
      @required this.percentChange24hUsd,
      this.isFavorite = false,
      this.upperThreshold,
      this.lowerThreshold});

  String name;
  String symbol;
  double priceUsd;
  double priceBtc;
  String lastUpdated;
  double percentChange24hUsd;

  bool isFavorite;
  double upperThreshold;
  double lowerThreshold;

  factory Currency.fromJson(Map<String, dynamic> json) {
    print(json['priceBtc']);
    return Currency(
        name: json['name'],
        symbol: json['symbol'],
        priceUsd: double.parse(json['priceUsd']),
        priceBtc: double.parse(json['priceBtc']),
        percentChange24hUsd: double.parse(json['percentChange24hUsd']),
        lastUpdated: json['lastUpdated']);
  }
}
