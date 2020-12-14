import 'package:Projektgrupp4/global_widgets/currency_card.dart';
import 'package:Projektgrupp4/models/currency.dart';
import 'package:Projektgrupp4/screens/search_screen/currency_list_view.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final String title = 'Search';
  @override
  Widget build(BuildContext context) {
    return Container(child: CurrencyListView());
  }
}
