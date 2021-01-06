import 'package:Projektgrupp4/global_widgets/percentage_text.dart';
import 'package:Projektgrupp4/models/currency.dart';
import 'package:Projektgrupp4/screens/currency_screen/currency_screen.dart';
import 'package:Projektgrupp4/global_widgets/favorite_check_box.dart';
import 'package:Projektgrupp4/states/currencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Row(children: [
      Expanded(
        flex: 5,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CurrencyScreen(widget.currency)));
          },
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
                        child: percentageText(
                            widget.currency.percentChange24hUsd,
                            TextStyle(
                              fontSize: Theme.of(context).textTheme.headline6.fontSize,
                            )))),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: FavoriteCheckBox(
          isSelected: widget.currency.isFavorite,
          isSelectable: true,
          onTap: () {
            setState(() {
              widget.currency.isFavorite = !widget.currency.isFavorite;
              if (!widget.currency.isFavorite) {
                Provider.of<Currencies>(context, listen: false).updateCurrency(
                    symbol: widget.currency.symbol, isFavorite: widget.currency.isFavorite);
              }
            });
          },
        ),
      )
    ]);
  }
}
