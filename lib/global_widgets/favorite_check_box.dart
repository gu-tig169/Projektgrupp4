import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isSelected = false;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _isSelected = !_isSelected;
          },
        );
      },
      child: Container(
        child: _isSelected
            ? Icon(
                Icons.star,
                color: Colors.grey,
                size: 35,
              )
            : Icon(
                Icons.star,
                color: Colors.yellow[700],
                size: 35,
              ),
      ),
    );
  }
}
