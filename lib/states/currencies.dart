import 'package:Projektgrupp4/models/currency.dart';
import 'package:Projektgrupp4/utils/firebase_api.dart';
import 'package:Projektgrupp4/utils/shrimpy_api.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';

class Currencies extends ChangeNotifier {
  Currencies() {
    fetchMarketData();
    if (list == null)
      list = List.generate(
          5,
          (index) => Currency(
                name: 'TestCurrency-$index',
                symbol: 'TST$index',
                priceUsd: 130000.0,
                priceBtc: 1,
                percentChange24hUsd: 5,
                isFavorite: true,
                hasUpperThreshold: true,
                upperThreshold: 99999,
                hasLowerThreshold: true,
                lowerThreshold: 9999,
                lastUpdated: "igår asså",
              ));
  }

  List<Currency> _list = List<Currency>();
  bool loading = false;

  void fetchMarketData() async {
    loading = true;
    notifyListeners();
    List<dynamic> json = await ShrimpyApi.getTickers();

    Map<dynamic, dynamic> favorites = await FirebaseApi.getFavorites();

    for (int i = 0; i < json.length; i++) {
      list.add(Currency.fromJson(Map.from(json[i])));
      String symbol = json[i]['symbol'];
      if (favorites != null && favorites.containsKey(symbol)) {
        Currency target = list.where((e) => e.symbol == symbol).first;
        target.isFavorite = true;
        if (favorites[symbol]['upperThreshold'] != null) {
          target.hasUpperThreshold = true;
          target.upperThreshold = double.parse(favorites[symbol]['upperThreshold'].toString());
        }
        if (favorites[symbol]['lowerThreshold'] != null) {
          target.hasLowerThreshold = true;
          target.lowerThreshold = double.parse(favorites[symbol]['lowerThreshold'].toString());
        }
      }
    }
    // list = List.generate(json.length, (index) => Currency.fromJson(Map.from(json[index])));
    loading = false;

    notifyListeners();
  }

  void fetchFavorites() {}

  void updateCurrency(
      {String name,
      @required String symbol,
      double priceUsd,
      double priceBtc,
      String lastUpdated,
      double percentChange24hUsd,
      bool isFavorite = false,
      bool hasUpperThreshold = false,
      double upperThreshold,
      bool hasLowerThreshold = false,
      double lowerThreshold}) {
    Currency target = list.where((e) => e.symbol == symbol).first;

    if (!isFavorite) {
      FirebaseApi.removeFavorites(symbol);
    }

    target.isFavorite = isFavorite;
    target.hasUpperThreshold = hasUpperThreshold;
    target.upperThreshold = upperThreshold;
    target.hasLowerThreshold = hasLowerThreshold;
    target.lowerThreshold = lowerThreshold;
    FirebaseApi.saveFavorites(list.where((e) => e.isFavorite).toList());

    notifyListeners();
  }

  List<Currency> get list => _list;
  set list(List<Currency> value) {
    _list = value;
    notifyListeners();
  }
}
