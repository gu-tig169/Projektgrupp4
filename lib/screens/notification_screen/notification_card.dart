import 'package:Projektgrupp4/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationCard extends StatelessWidget {
  final Currency currency;
  final bool passedThreshold;
  NotificationCard(this.currency, this.passedThreshold);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 12.0, bottom: 12.0),
      child: Row(
        children: [
          _icon(),
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
    );
  }

  Widget _icon() {
    if (passedThreshold)
      return Icon(
        Icons.arrow_upward,
        color: Colors.green,
      );
    return Icon(
      Icons.arrow_downward,
      color: Colors.red,
    );
  }

  Widget _notificationText() {
    if (passedThreshold) return Text('Has exceeded your upper threshold');
    return Text('Has dropped below your lower threshold');
  }
}
