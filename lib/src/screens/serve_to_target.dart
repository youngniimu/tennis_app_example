import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import '../widgets/court_progress.dart';
import '../widgets/action_button.dart';
import '../widgets/serveData.dart';

class ServeToTarget extends StatefulWidget {
  createState() {
    return ServeToTargetState();
  }
}

class ServeToTargetState extends State<ServeToTarget> {
  bool serveDrillRunning = false;
  int servesIn = 0;
  int totalServes = 0;
  double serveProb = 0;

  Widget build(context) {
    return Scaffold(
      floatingActionButton:
          serveDrillRunning && servesIn < 6 ? serveButton() : null,
      backgroundColor: Color(0xFF005E84), // THEME
      body: Container(
        margin: EdgeInsets.all(100.0), // THEME
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            title(),
            courtImage(),
            serveDataRow(),
            !serveDrillRunning ? startButton(context) : restartButton(),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      child: Column(
        children: [
          Text(
            'Serve to target',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(margin: EdgeInsets.only(bottom: 10.0)),
          Text(
            'Serve To Six Targets on The Court',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  // displays the court as a background image,
  // on top of that is an X-axis rotated container in perspective
  // to fit both of the service boxes
  Widget courtImage() {
    return Container(
      width: 1300,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/court.png'),
        ),
      ),
      child: Align(
        alignment: Alignment(0.038, 0.45),
        child: Transform(
          transform: Matrix4(
            1, 0, 0, 0, // additional comment lines to prevent
            0, 1, 0, 0, // auto-formatting in vscode
            0, 0, 1, 0.02, //
            0, 0, 0, 1, //
          )..rotateX(-0.105),
          alignment: FractionalOffset.center,
          child: CourtProgress(
            servesIn: servesIn,
            // index: index,
            serveDrillRunning: serveDrillRunning,
          ),
        ),
      ),
    );
  }

  // displays totalServes and servesIn
  Widget serveDataRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ServeData(
          title: 'Serves In',
          data: '$servesIn',
          darkTheme: false,
        ),
        Container(margin: EdgeInsets.all(40.0)),
        ServeData(
          title: 'Total Serves',
          data: '$totalServes',
          darkTheme: false,
        ),
      ],
    );
  }

  Widget startButton(context) {
    return CustomActionButton(
      title: 'START',
      color: Color(0xFF007E9E),
      textColor: Colors.white,
      onPressed: () => startButtonAction(context),
    );
  }

  void startButtonAction(context) {
    Timer(Duration(seconds: 1), () {
      setState(() {
        this.serveDrillRunning = true;
      });
    });
    Navigator.pushNamed(context, '/lets_go');
  }

  restartButton() {
    return CustomActionButton(
      title: 'RESTART',
      color: Colors.white,
      textColor: Color(0xFF005E85),
      onPressed: restartButtonAction,
    );
  }

  void restartButtonAction() {
    setState(() {
      servesIn = 0;
      totalServes = 0;
    });
  }

  // simulates serving if the drill is ongoing
  Widget serveButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          this.totalServes += 1;
          this.servesIn += Random().nextInt(2);
          this.serveProb = (servesIn / totalServes) * 100;
        });
        if (servesIn == 6) {
          Timer(Duration(milliseconds: 700), () {
            Navigator.pushNamed(context, '/nicely_done',
                arguments: PassedArguments(
                    totalServes: '$totalServes',
                    prob: serveProb.toStringAsFixed(0)));
          });
        }
      },
      backgroundColor: Colors.green,
      child: Icon(Icons.sports_tennis),
    );
  }
}

class PassedArguments {
  final String prob;
  final String totalServes;

  PassedArguments({this.prob, this.totalServes});
}
