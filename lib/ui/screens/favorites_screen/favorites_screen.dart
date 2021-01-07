import 'package:Projektgrupp4/ui/global_widgets/currency_list_view.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final String title = 'Favorites';
  @override
  Widget build(BuildContext context) {
    return CurrencyListView(isFavoriteScreen: true);
  }
}
