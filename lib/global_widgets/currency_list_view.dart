import 'package:Projektgrupp4/global_widgets/currency_card.dart';
import 'package:Projektgrupp4/states/currencies.dart';
import 'package:Projektgrupp4/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading_animations/loading_animations.dart';

class CurrencyListView extends StatelessWidget {
  final Currency currency = new Currency(
    name: 'TestCurrency',
    symbol: 'TST',
    priceUsd: 130000.0,
    priceBtc: 1,
    percentChange24hUsd: 5,
    isFavorite: true,
    lastUpdated: "igår asså",
  );

  final bool favoriteIsCalling = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: titleBar(context),
        ),
        Expanded(
          flex: 11,
          child: Consumer<Currencies>(
            builder: (context, state, child) => (state.loading)
                ? LoadingFlipping.circle()
                : ListView.separated(
                    itemCount: state.list?.length,
                    itemBuilder: (context, index) => favoriteIsCalling == true
                        ? CurrencyCard(currency)
                        : CurrencyCard(state.list[index]),
                    separatorBuilder: (context, index) => Divider(),
                  ),
          ),
        ),
      ],
    );
  }
}

Widget titleBar(context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            flex: 3,
            child: Text(
              'Name',
              style: Theme.of(context).textTheme.headline5,
              overflow: TextOverflow.ellipsis,
            )),
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text('Change (24 h)',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline6.fontSize,
                  )),
            )),
        Expanded(
          flex: 1,
          child: Text(''),
        )
      ],
    ),
    width: 2000,
    height: 200,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.blue,
      border: Border.all(width: 3, color: Colors.black),
    ),
  );
}
