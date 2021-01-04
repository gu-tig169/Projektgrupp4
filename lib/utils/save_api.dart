import 'dart:convert';

import 'package:Projektgrupp4/models/currency.dart';
import 'package:Projektgrupp4/states/currencies.dart';
import 'package:http/http.dart' as http;

class SaveApi {
  //OBS FAKE!
  static String _url = 'supermegasuperfakeapi.com';

  static void saveCurrencies(List<Currency> currencies) async {
    List json =
        List.generate(currencies.length, (index) => currencies[index].toJson());

    await http.post(
      _url,
      body: jsonEncode(json),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
