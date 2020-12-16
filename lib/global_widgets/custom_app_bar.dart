import 'package:flutter/material.dart';

Widget appBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    iconTheme: IconThemeData(color: Colors.black),
    shadowColor: Colors.transparent,
  );
}
