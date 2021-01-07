import 'package:Projektgrupp4/ui/global_widgets/currency_list_view.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final String title = 'Search';
  @override
  Widget build(BuildContext context) {
    return Container(child: CurrencyListView(isFavoriteScreen: false));
  }
}
