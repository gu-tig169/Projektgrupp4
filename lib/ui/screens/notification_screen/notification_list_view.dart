import 'package:Projektgrupp4/models/currency.dart';
import 'package:Projektgrupp4/ui/global_widgets/no_favorites_text.dart';
import 'package:Projektgrupp4/ui/screens/notification_screen/notification_card.dart';
import 'package:Projektgrupp4/ui/states/currencies.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading_animations/loading_animations.dart';

class NotificationListView extends StatelessWidget {
  bool checkThreshold(Currency currency) {
    if (currency.upperThreshold != null && currency.priceUsd > currency.upperThreshold) {
      return true;
    } else if (currency.lowerThreshold != null && currency.priceUsd < currency.lowerThreshold) {
      return false;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Currencies>(builder: (context, state, child) {
      List<Currency> favorites = state.favorites;
      List<Currency> list = favorites.where((e) => checkThreshold(e) != null).toList();

      return (state.loading)
          ? LoadingFlipping.circle()
          : (list.length <= 0)
              ? NoFavoritesText((favorites.length <= 0)
                  ? 'You have no favorites yet.'
                  : 'No thresholds have been passed yet.')
              : ListView.separated(
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      NotificationCard(list[index], checkThreshold(list[index])),
                  separatorBuilder: (context, index) => Divider(),
                );
    });
  }
}
