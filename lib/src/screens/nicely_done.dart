import 'package:flutter/material.dart';
import 'dart:async';
import './serve_to_target.dart';

class NicelyDone extends StatelessWidget {
  Widget build(context) {
    final PassedArguments args = ModalRoute.of(context).settings.arguments;
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/results', arguments: PassedArguments(prob: args.prob, totalServes: args.totalServes));
    });
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nicely done!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Container(margin: EdgeInsets.all(20.0)),
            Text(
              'Loading results...',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Container(margin: EdgeInsets.all(30.0)),
            Icon(Icons.check, size: 90.0, color: Color(0xFF87DAF8))
          ],
        ),
      ),
    );
  }
}
