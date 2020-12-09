import 'package:flutter/material.dart';
import 'dart:async';

class LetsGo extends StatelessWidget {
  LetsGo(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005E84),
      body: Center(
        child: Text(
          'Let\'s go!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
