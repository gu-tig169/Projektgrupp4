import 'package:Projektgrupp4/models/currency.dart';
import 'package:flutter/material.dart';

class FavoriteCheckBox extends StatefulWidget {
  FavoriteCheckBox(this.currency, this.isSelectable);
  final bool isSelectable;

  final Currency currency;

  @override
  _FavoriteCheckBoxState createState() => _FavoriteCheckBoxState();
}

class _FavoriteCheckBoxState extends State<FavoriteCheckBox> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.currency.isFavorite;
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isSelectable
          ? () {
              setState(
                () {
                  _isSelected = !_isSelected;
                },
              );
            }
          : null,
      child: Container(
        child: _isSelected
            ? Icon(
                Icons.star,
                color: Colors.yellow[700],
                size: 35,
              )
            : Icon(
                Icons.star,
                color: Colors.grey,
                size: 35,
              ),
      ),
    );
  }
}
