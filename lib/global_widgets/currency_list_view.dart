import 'package:Projektgrupp4/global_widgets/currency_card.dart';
import 'package:Projektgrupp4/models/currency.dart';
import 'package:Projektgrupp4/states/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading_animations/loading_animations.dart';

class CurrencyListView extends StatefulWidget {
  final bool isFavoriteScreen;
  final TextEditingController searchController = TextEditingController();
  CurrencyListView({this.isFavoriteScreen = false});

  @override
  _CurrencyListViewState createState() => _CurrencyListViewState();
}

class _CurrencyListViewState extends State<CurrencyListView> {
  List<Currency> _searchFilter(List<Currency> list) {
    return list
        .where((e) =>
            e.name
                .toLowerCase()
                .contains(widget.searchController.text.toLowerCase()) ||
            e.symbol
                .toLowerCase()
                .contains(widget.searchController.text.toLowerCase()))
        .toList();
  }



  @override
  Widget build(BuildContext context) {
    List<Currency> favorites = Provider.of<Currencies>(context, listen: false)
        .list
        .where((e) => e.isFavorite)
        .toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            controller: widget.searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: titleBar(context),
        ),
        Expanded(
          flex: 11,
          child: Consumer<Currencies>(
            builder: (context, state, child) => (state.loading)
                ? LoadingFlipping.circle()
                : ListView.separated(
                    itemCount: (widget.isFavoriteScreen)
                        ? _searchFilter(favorites).length
                        : _searchFilter(state.list).length,
                    itemBuilder: (
                      context,
                      index,
                    ) =>
                        (widget.isFavoriteScreen)
                            ? CurrencyCard(_searchFilter(favorites)[index])
                            : CurrencyCard(_searchFilter(state.list)[index]),
                    separatorBuilder: (context, index) => Divider(),
                  ),
          ),
        ),
      ],
    );
  }

  Widget titleBar(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Name',
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'Change',
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
          Expanded(
            flex: 1,
            child: Text(' (24 h)'),
          )
        ],
      ),
      width: 2000,
      height: 200,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
    );
  }
}
