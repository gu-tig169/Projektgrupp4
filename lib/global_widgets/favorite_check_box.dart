import 'package:Projektgrupp4/models/currency.dart';
import 'package:flutter/material.dart';

class FavoriteCheckBox extends StatelessWidget {
  FavoriteCheckBox({this.onTap, this.isSelected, this.isSelectable});
  final Function onTap;
  final bool isSelectable;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelectable ? onTap : null,
      child: Container(
        child: isSelected
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
