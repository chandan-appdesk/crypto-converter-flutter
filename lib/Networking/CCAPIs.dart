import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Models.dart';

const apiKey = "B97576B0-949A-4A2B-9116-10C383670502";
const baseURL = "https://rest.coinapi.io/v1";

class CCAPIs {
  // Making Singleton class
  CCAPIs._privateConstructor();
  static final CCAPIs _instance = CCAPIs._privateConstructor();
  factory CCAPIs() {
    return _instance;
  }

  Future<CryptoExchangeRateResponse?> getExchangeRates(String crypto, String currency) async {
    final url = Uri.parse('$baseURL/exchangerate/$crypto/$currency?apikey=$apiKey');
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      CryptoExchangeRateResponse exchangeRate = CryptoExchangeRateResponse.fromJson(jsonResponse);
      print("Chandan-------------------------------------");
      print(exchangeRate.rate);
      return exchangeRate;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
}