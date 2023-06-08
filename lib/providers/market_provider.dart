import 'dart:async';

import 'package:crypto1/models/Cryptocurrency.dart';
import 'package:flutter/cupertino.dart';
import '../models/API.dart';

class MarketProvider with ChangeNotifier {
  bool isloading = true;
  List<CryptoCurrency> markets = [];

  MarketProvider() {
    fetchData();
  }

  void fetchData() async {
    List<dynamic> _markets = await API.getMarkets();
    List<CryptoCurrency> temp = [];
    for (var market in _markets) {
      CryptoCurrency newCrypto = CryptoCurrency.fromJSON(market);
      temp.add(newCrypto);
    }
    markets = temp;
    isloading = false;
    notifyListeners();

    Timer(const Duration(seconds: 3), () {
      fetchData();
      print("Data Updated");
    });
  }
}
