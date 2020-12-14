import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/currency.dart';
import 'favorite_check_box.dart';


class CurrencyCard extends StatefulWidget {
  final Currency currency;
  CurrencyCard(this.currency);

  @override
  _CurrencyCardState createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      child: Row(
        children: [
          Text(widget.currency.name), //Test
          Text(widget.currency.percentChange24Usd), //Test
          FavoriteCheckBox(widget.currency) //Test, skall vara en stjärn checkbox
        ],
      ),
    );
  }
}
