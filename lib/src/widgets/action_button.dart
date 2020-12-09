import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color color;
  final Function onPressed;

  CustomActionButton({this.title, this.color, this.textColor, this.onPressed});

  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Text(
        '$title',
        style: TextStyle(
          color: textColor,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
