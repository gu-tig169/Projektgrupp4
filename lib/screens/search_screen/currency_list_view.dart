import 'package:Projektgrupp4/global_widgets/currency_card.dart';
import 'package:Projektgrupp4/states/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading_animations/loading_animations.dart';

class CurrencyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Currencies>(
      builder: (context, state, child) => (state.loading)
          ? LoadingFlipping.circle()
          : ListView.separated(
              itemCount: state.list?.length,
              itemBuilder: (context, index) => CurrencyCard(state.list[index]),
              separatorBuilder: (context, index) => Divider(),
            ),
    );
  }
}
