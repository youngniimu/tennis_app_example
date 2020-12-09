import 'package:flutter/material.dart';

class ServeData extends StatelessWidget {
  final String data;
  final String title;
  final bool darkTheme;

  ServeData({this.data, this.title, @required this.darkTheme});

  build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$data',
          style: TextStyle(
            color: !darkTheme ? Colors.white : Colors.black,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$title',
          style: TextStyle(
            color: !darkTheme ? Colors.white  : Colors.grey,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
