import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static Future<List<dynamic>> getMarkets() async {
    Uri requestPath = Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=zar&order=market_cap_desc&per_page=10&page=1&sparkline=false&locale=en");
    var response = await http.get(requestPath);
    var decodedResponse = jsonDecode(response.body);
    List<dynamic> markets = decodedResponse as List<dynamic>;
    return markets;
  }
}
