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
      this.hasUpperThreshold = false,
      this.upperThreshold,
      this.hasLowerThreshold = false,
      this.lowerThreshold});

  String name;
  String symbol;
  double priceUsd;
  double priceBtc;
  String lastUpdated;
  double percentChange24hUsd;

  bool isFavorite;
  bool hasUpperThreshold;
  double upperThreshold;
  bool hasLowerThreshold;
  double lowerThreshold;

  factory Currency.fromJson(Map<String, dynamic> json) {
    print(json['percentChange24hUsd']);
    return Currency(
        name: json['name'],
        symbol: json['symbol'],
        priceUsd: double.parse(json['priceUsd'] ?? 'NaN'),
        priceBtc: double.parse(json['priceBtc'] ?? 'NaN'),
        percentChange24hUsd: double.parse(json['percentChange24hUsd'] ?? 'NaN'),
        lastUpdated: json['lastUpdated']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'symbol': symbol,
      'isFavorite': isFavorite,
      'hasUpperThreshold': hasUpperThreshold,
      'upperThreshold': upperThreshold,
      'hasLowerThreshold': hasLowerThreshold,
      'lowerThreshold': lowerThreshold,
    };
  }
}
