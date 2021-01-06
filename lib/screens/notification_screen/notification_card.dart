import 'package:Projektgrupp4/models/currency.dart';
import 'package:Projektgrupp4/screens/currency_screen/currency_screen.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final Currency currency;
  final bool passedThreshold;
  NotificationCard(this.currency, this.passedThreshold);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CurrencyScreen(currency)))
            .then((value) => this.build(context));
      },
      child: Container(
        padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 12.0, bottom: 12.0),
        child: Row(
          children: [
            _icon(),
            Padding(padding: EdgeInsets.only(right: 24.0)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currency.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                _notificationText()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    if (passedThreshold)
      return Icon(
        Icons.arrow_upward,
        color: Colors.green,
        size: 42.0,
      );
    return Icon(
      Icons.arrow_downward,
      color: Colors.red,
      size: 42.0,
    );
  }

  Widget _notificationText() {
    if (passedThreshold) {
      String diff = (currency.priceUsd - currency.upperThreshold).toStringAsFixed(4);
      return Text('Has exceeded your upper threshold\nby \$$diff USD');
    } else {
      String diff = (currency.lowerThreshold - currency.priceUsd).toStringAsFixed(4);
      return Text('Has dropped below your lower threshold\nby \$$diff USD');
    }
  }
}
