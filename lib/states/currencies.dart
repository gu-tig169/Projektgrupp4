import 'package:Projektgrupp4/models/currency.dart';
import 'package:Projektgrupp4/utils/shrimpy_api.dart';
import 'package:flutter/widgets.dart';

class Currencies extends ChangeNotifier {
  Currencies() {
    // _list = List.generate(
    //     5,
    //     (index) => Currency(
    //           name: 'TestCurrency-$index',
    //           symbol: 'TST$index',
    //           priceUsd: 130000.0,
    //           priceBtc: 1,
    //           percentChange24hUsd: 5,
    //           isFavorite: false,
    //           lastUpdated: "igår asså",
    //         ));
    fetchMarketData();
  }

  List<Currency> _list = List<Currency>();
  bool loading = false;

  void fetchMarketData() async {
    loading = true;
    notifyListeners();
    List<dynamic> json = await ShrimpyApi.getTickers();
    list = List.generate(json.length, (index) => Currency.fromJson(Map.from(json[index])));
    loading = false;
    notifyListeners();
  }

  List<Currency> get list => _list;
  set list(List<Currency> value) {
    _list = value;
    notifyListeners();
  }
}
