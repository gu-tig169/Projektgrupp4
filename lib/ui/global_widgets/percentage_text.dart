import 'package:flutter/material.dart';

Widget percentageText(double percentage, TextStyle style) {
  Color _color;
  if (percentage.toString() == 'NaN') {
    _color = Colors.grey;
  } else if (percentage < 0) {
    _color = Colors.red;
  } else {
    _color = Colors.green;
  }

  TextStyle textStyle =
      TextStyle(color: _color, fontWeight: style.fontWeight, fontSize: style.fontSize);

  return Text((percentage.toString() == 'NaN') ? 'No data' : '${percentage.toStringAsFixed(2)}%',
      style: textStyle);
}
