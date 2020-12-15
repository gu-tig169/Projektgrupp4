import 'dart:convert';

import 'package:http/http.dart' as http;

class ShrimpyApi {
  static String _tickerUrl = 'https://dev-api.shrimpy.io/v1/exchanges/binance/ticker';

  static Future<List<dynamic>> getTickers() async {
    http.Response response = await http.get(_tickerUrl);
    return jsonDecode(response.body);
  }
}
