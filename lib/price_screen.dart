import 'package:bitcoin/CryptoCard.dart';
import 'package:flutter/material.dart';
import 'CryptoViewModel.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String crypto = 'BTC';
  String currency = 'USD';
  double rateOfCurrencyBTC = 0.0;
  double rateOfCurrencyETH = 0.0;
  double rateOfCurrencyUSDT = 0.0;
  Color colorOfCard = Colors.lightBlueAccent;

  CryptoViewModel cryptoViewModel = CryptoViewModel();

  void getExchangeRates() async {
    double rateBTC = await cryptoViewModel.getExchangeRates('BTC', currency);
    double rateETH = await cryptoViewModel.getExchangeRates('ETH', currency);
    double rateUSDT = await cryptoViewModel.getExchangeRates('USDT', currency);

    setState(() {
      rateOfCurrencyBTC = rateBTC.roundToDouble();
      rateOfCurrencyETH = rateETH.roundToDouble();
      rateOfCurrencyUSDT = rateUSDT.roundToDouble();
    });
  }

  DropdownButton getAndroidDropDown() {
    return DropdownButton(
      value: currency.toString(),
      items: getDropDownItems(),
      onChanged: (value) {
        setState(() {
          currency = value ?? 'USD';
          getExchangeRates();
        });
      },
    );
  }

  CupertinoPicker getIosPicker() {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      useMagnifier: true,
      itemExtent: 40,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          currency = currenciesList[selectedIndex];
          getExchangeRates();
        });
      },
      children: getDropDownItems().map((item) {
        return Center(child: item.child);
      }).toList(),
    );
  }

  List<DropdownMenuItem<String>> getDropDownItems() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var item = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropDownItems.add(item);
    }
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CryptoCard(crypto: 'BTC', currency: currency, rateOfCurrency: rateOfCurrencyBTC, colorOfCard: Colors.red),
          CryptoCard(crypto: 'ETH', currency: currency, rateOfCurrency: rateOfCurrencyETH, colorOfCard: Colors.green),
          CryptoCard(crypto: 'USDT', currency: currency, rateOfCurrency: rateOfCurrencyUSDT, colorOfCard: Colors.blueAccent),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid ? getAndroidDropDown() : getIosPicker(),
          ),
        ],
      ),
    );
  }
}