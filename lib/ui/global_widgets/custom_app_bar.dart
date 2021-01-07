import 'package:flutter/material.dart';

Widget appBar(BuildContext context, {String title, List<Widget> actions}) {
  return AppBar(
    title: Text(
      title ?? '',
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    iconTheme: IconThemeData(color: Colors.black),
    shadowColor: Colors.transparent,
    actions: actions ?? null,
  );
}
