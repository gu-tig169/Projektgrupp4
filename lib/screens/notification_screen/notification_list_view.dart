import 'package:Projektgrupp4/models/currency.dart';
import 'package:Projektgrupp4/screens/notification_screen/notification_card.dart';
import 'package:Projektgrupp4/states/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationListView extends StatelessWidget {
  bool checkThreshold(Currency currency) {
    if (currency.priceUsd > currency.upperThreshold) {
      return true;
    } else if (currency.priceUsd < currency.lowerThreshold) {
      return false;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Currency> favorites = Provider.of<Currencies>(context, listen: false)
        .list
        .where((e) => e.isFavorite)
        .toList()
        .where((e) => checkThreshold(e) != null)
        .toList();
    return ListView.separated(
      itemCount: favorites.length,
      itemBuilder: (context, index) =>
          NotificationCard(favorites[index], checkThreshold(favorites[index])),
      separatorBuilder: (context, index) => Divider(),
    );
  }
}
