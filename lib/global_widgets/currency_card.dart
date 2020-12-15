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
  Color _precentageColor() {
    if (widget.currency.percentChange24hUsd < 0) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 24, right: 12, top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  widget.currency.name,
                  style: Theme.of(context).textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text('${widget.currency.percentChange24hUsd.toStringAsFixed(2)}%',
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.headline6.fontSize,
                        color: _precentageColor(),
                      )),
                )),
            Expanded(
              flex: 1,
              child: FavoriteCheckBox(widget.currency, false),
            )
          ],
        ),
      ),
    );
  }
}
