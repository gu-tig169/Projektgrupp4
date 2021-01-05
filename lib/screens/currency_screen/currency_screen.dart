import 'package:Projektgrupp4/global_widgets/custom_app_bar.dart';
import 'package:Projektgrupp4/global_widgets/favorite_check_box.dart';
import 'package:Projektgrupp4/global_widgets/percentage_text.dart';
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

  bool _saveCheck() {
    if (_isFavorite || _hasUpperThreshold && upperController.text != '') {
      if (_hasLowerThreshold && lowerController.text == '') {
        return false;
      }
      return true;
    }
    if (_isFavorite || _hasLowerThreshold && lowerController.text != '') {
      if (_hasUpperThreshold && upperController.text == '') {
        return false;
      }
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: widget.currency.name, actions: [
        Tooltip(
          message: 'Please enter notification specifications to save',
          child: TextButton(
              onPressed: (_saveCheck())
                  ? () {
                      Provider.of<Currencies>(context, listen: false).updateCurrency(
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
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: Text('Saved notification settings'),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Got it'))
                                ],
                              ));
                    }
                  : null,
              child: Text('Save')),
        )
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 12.0, bottom: 12.0),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price', style: TextStyle(color: Colors.white, fontSize: 14.0)),
                    Text('Change (24h)', style: TextStyle(color: Colors.white, fontSize: 14.0))
                  ],
                ),
                Row(
                  children: [
                    Tooltip(
                      message: '\$${widget.currency.priceUsd.toString()} USD',
                      child: Text('\$${widget.currency.priceUsd.toStringAsFixed(3)} USD',
                          style: TextStyle(color: Colors.white, fontSize: 24.0)),
                    ),
                    Spacer(flex: 1),
                    percentageText(
                        widget.currency.percentChange24hUsd,
                        TextStyle(
                            fontSize: Theme.of(context).textTheme.headline6.fontSize,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                Text('Updated: ' + widget.currency.lastUpdatedGMTString(),
                    style: TextStyle(color: Colors.white, fontSize: 12))
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 24.0)),
          Container(
            padding: EdgeInsets.only(left: 6),
            child: Row(
              children: [
                FavoriteCheckBox(
                    onTap: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                        if (!_isFavorite) {
                          Provider.of<Currencies>(context, listen: false).updateCurrency(
                              symbol: widget.currency.symbol, isFavorite: _isFavorite);
                        }
                      });
                    },
                    isSelected: _isFavorite,
                    isSelectable: true),
                Container(
                    padding: EdgeInsets.only(left: 6),
                    child: Text('Notify me', style: Theme.of(context).textTheme.headline6))
              ],
            ),
          ),
          if (_isFavorite) notificationOptions()
        ],
      ),
    );
  }

  Widget notificationOptions() {
    return Container(
      padding: EdgeInsets.only(right: 24),
      child: Column(
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
                  child: Container(
                height: 26,
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
                ),
              )),
              Text('USD')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  child: Container(
                height: 26,
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
                ),
              )),
              Text('USD')
            ],
          ),
        ],
      ),
    );
  }
}
