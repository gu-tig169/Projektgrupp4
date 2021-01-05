import 'package:flutter/material.dart';

class NoFavoritesText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(50.0),
          child: Text(
            'You have no favorites yet.\nAdd some with thresholds and watch your money grow!',
            style: TextStyle(color: Colors.grey, fontSize: 24.0),
            textAlign: TextAlign.center,
          )),
    );
  }
}
