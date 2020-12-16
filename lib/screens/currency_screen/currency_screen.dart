import 'package:Projektgrupp4/global_widgets/custom_app_bar.dart';
import 'package:Projektgrupp4/global_widgets/favorite_check_box.dart';
import 'package:Projektgrupp4/models/currency.dart';
import 'package:Projektgrupp4/states/currencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CurrencyScreen extends StatefulWidget {
  final Currency currency;
  CurrencyScreen(this.currency);

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  bool _isFavorite;

  bool _hasUpperThreshold;
  bool _hasLowerThreshold;

  TextEditingController upperController = TextEditingController();
  TextEditingController lowerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.currency.isFavorite;

    _hasUpperThreshold = widget.currency.hasUpperThreshold;
    _hasLowerThreshold = widget.currency.hasLowerThreshold;

    upperController.text = widget.currency.upperThreshold?.toString() ?? '';
    lowerController.text = widget.currency.lowerThreshold?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, widget.currency.name),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text('\$${widget.currency.priceUsd.toString()} USD',
                    style: TextStyle(color: Colors.white, fontSize: 24.0)),
                Text('Updated: ${widget.currency.lastUpdated}',
                    style: TextStyle(color: Colors.white, fontSize: 12))
              ],
            ),
          ),
          Row(
            children: [
              FavoriteCheckBox(
                  onTap: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                      if (!_isFavorite) {
                        Provider.of<Currencies>(context, listen: false)
                            .updateCurrency(
                                symbol: widget.currency.symbol,
                                isFavorite: _isFavorite);
                      }
                    });
                  },
                  isSelected: _isFavorite,
                  isSelectable: true),
              Text('Notify me', style: Theme.of(context).textTheme.headline6)
            ],
          ),
          if (_isFavorite) notificationOptions()
        ],
      ),
    );
  }

  Widget notificationOptions() {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
                value: _hasUpperThreshold,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    _hasUpperThreshold = value;
                  });
                }),
            Text('When currency exceeds: \$'),
            Expanded(
                child: TextField(
              controller: upperController,
              enabled: _hasUpperThreshold,
              onChanged: (value) {
                setState(() {});
              },
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
            )),
            Text('USD')
          ],
        ),
        Row(
          children: [
            Checkbox(
                value: _hasLowerThreshold,
                onChanged: (value) {
                  setState(() {
                    _hasLowerThreshold = value;
                  });
                }),
            Text('When currency drops below: \$'),
            Expanded(
                child: TextField(
              controller: lowerController,
              enabled: _hasLowerThreshold,
              onChanged: (value) {
                setState(() {});
              },
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
            )),
            Text('USD')
          ],
        ),
        IconButton(
          onPressed: ((_hasUpperThreshold && upperController.text != '') ||
                  (_hasLowerThreshold && lowerController.text != ''))
              ? () {
                  Provider.of<Currencies>(context, listen: false)
                      .updateCurrency(
                    symbol: widget.currency.symbol,
                    isFavorite: _isFavorite,
                    hasUpperThreshold: _hasUpperThreshold,
                    upperThreshold: (upperController.text != '')
                        ? double.parse(upperController.text)
                        : null,
                    hasLowerThreshold: _hasLowerThreshold,
                    lowerThreshold: (lowerController.text != '')
                        ? double.parse(lowerController.text)
                        : null,
                  );
                }
              : null,
          icon: Icon(Icons.save),
        )
      ],
    );
  }
}
