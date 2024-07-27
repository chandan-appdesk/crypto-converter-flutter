
class CryptoExchangeRateResponse {
  DateTime? time;
  String? assetIdBase;
  String? assetIdQuote;
  double? rate;

  CryptoExchangeRateResponse({
    this.time,
    this.assetIdBase,
    this.assetIdQuote,
    this.rate,
  });

  factory CryptoExchangeRateResponse.fromJson(Map<String, dynamic> json) {
    return CryptoExchangeRateResponse(
      time: DateTime.parse(json['time']),
      assetIdBase: json['asset_id_base'],
      assetIdQuote: json['asset_id_quote'],
      rate: json['rate'],
    );
  }
}



// "time": "2024-07-27T06:17:25.0000000Z",
// "asset_id_base": "BTC",
// "asset_id_quote": "INR",
// "rate": 5691052.316089349
//