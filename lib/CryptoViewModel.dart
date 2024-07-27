import 'Networking/CCAPIs.dart';
import 'Networking/Models.dart';

class CryptoViewModel {
  final CCAPIs _ccapis = CCAPIs();

  Future<double> getExchangeRates(String crypto, String currency) async {
    CryptoExchangeRateResponse? response = await _ccapis.getExchangeRates(crypto, currency);
    return response?.rate ?? 0.0;
  }
}