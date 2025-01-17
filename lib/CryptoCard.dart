import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatefulWidget {
  final String currency;
  final double rateOfCurrency;
  final String crypto;
  final Color colorOfCard;

  const CryptoCard({
    required this.crypto,
    required this.currency,
    required this.rateOfCurrency,
    required this.colorOfCard,
  });

  @override
  _CryptoCardState createState() => _CryptoCardState();
}

class _CryptoCardState extends State<CryptoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: widget.colorOfCard,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${widget.crypto} = ${widget.rateOfCurrency} ${widget.currency}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}