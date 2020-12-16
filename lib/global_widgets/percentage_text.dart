import 'package:flutter/material.dart';

Widget percentageText(double percentage, TextStyle style) {
  TextStyle textStyle = TextStyle(
      color: (percentage < 0) ? Colors.red : Colors.green,
      fontWeight: style.fontWeight,
      fontSize: style.fontSize);

  return Text('${percentage.toStringAsFixed(2)}%', style: textStyle);
}
