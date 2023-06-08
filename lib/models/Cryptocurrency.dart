class CryptoCurrency {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? marketCap;
  int? marketCapRank;
  double? high24;
  double? low24;
  double? priceChange24;
  double? priceChangePercentage24;
  double? circulatingSuppy;
  double? ath;
  double? atl;

  CryptoCurrency(
      {required this.ath,
      required this.atl,
      required this.circulatingSuppy,
      required this.currentPrice,
      required this.high24,
      required this.id,
      required this.image,
      required this.low24,
      required this.marketCap,
      required this.marketCapRank,
      required this.name,
      required this.priceChange24,
      required this.priceChangePercentage24,
      required this.symbol});

  factory CryptoCurrency.fromJSON(Map<String, dynamic> map) {
    return CryptoCurrency(
        ath: double.parse(map["ath"].toString()),
        atl: double.parse(map["atl"].toString()),
        circulatingSuppy: map["circulating_suppy"],
        currentPrice: double.parse(map["current_price"].toString()),
        high24: double.parse(map["high24"].toString()),
        id: map["id"],
        image: map["image"],
        low24: double.parse(map["low24"].toString()),
        marketCap: double.parse(map["market_cap"].toString()),
        marketCapRank: map["market_cap_rank"],
        name: map["name"],
        priceChange24: double.parse(map["price_change_24"].toString()),
        priceChangePercentage24:
            double.parse(map["price_change_percentage_24"].toString()),
        symbol: map["symbol"]);
  }
}
