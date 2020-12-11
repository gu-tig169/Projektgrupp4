import 'package:Projektgrupp4/models/currency.dart';
import 'package:flutter/widgets.dart';

class Currencies extends ChangeNotifier {
  Currencies() {
    _list = List.generate(
        5,
        (index) => Currency(
              name: 'TestCurrency-$index',
              symbol: 'TST$index',
              priceUsd: 130000.0,
              priceBtc: 1,
              isFavorite: false,
            ));
  }
  List<Currency> _list;

  List<Currency> get list => _list;
  set list(List<Currency> value) {
    _list = value;
    notifyListeners();
  }
}
