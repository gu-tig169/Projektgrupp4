import 'package:flutter/material.dart';

class NoFavoritesText extends StatelessWidget {
  NoFavoritesText(this.text);
  final String
      text; //'You have no favorites with thresholds yet.\nAdd some with thresholds and watch your money grow!'
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(50.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.grey, fontSize: 24.0),
            textAlign: TextAlign.center,
          )),
    );
  }
}
