import 'package:flutter/material.dart';
import 'dart:async';

class CourtProgress extends StatefulWidget {
  final int servesIn;
  final bool serveDrillRunning;

  CourtProgress({this.servesIn, this.serveDrillRunning});

  createState() {
    return CourtProgressState();
  }
}

class CourtProgressState extends State<CourtProgress> {
  Timer timer;
  int index = 1;

  initState() {
    super.initState();
    if (timer == null) {
      timer = Timer.periodic(Duration(seconds: 2), (timer) {
        setState(() {
          index == 6 ? index = 1 : index++;
        });
      });
    }
  }

  dispose() {
    timer?.cancel();
    super.dispose();
  }

  Widget build(BuildContext build) {
    return Container(
      color: widget.serveDrillRunning ? Colors.white.withOpacity(0.1) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:
            !widget.serveDrillRunning ? progressBarIdle() : progressBarDrill(),
      ),
    );
  }

  List<Widget> progressBarIdle() {
    List<Widget> children = [];
    for (var i = 1; i < 7; i++) {
      children.add(BarUnit(
        opacity: index == i ? 0.9 : 0,
        title: '$i',
      ));
    }
    return children;
  }

  progressBarDrill() {
    List<Widget> children = [];
    for (var i = 1; i < 7; i++) {
      children.add(
        DrillBarUnit(
          opacity: widget.servesIn >= i ? 0.8 : 0,
          border: widget.servesIn == i - 1
              ? Border.all(color: Colors.white, width: 5)
              : null,
          icon: widget.servesIn >= i
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 25,
                )
              : null,
        ),
      );
    }
    return children;
  }
}

class DrillBarUnit extends StatelessWidget {
  final Icon icon;
  final double opacity;
  final Border border;

  DrillBarUnit({this.opacity, this.icon, this.border});

  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1,
      duration: Duration(milliseconds: 200),
      child: Container(
        height: 120,
        width: 53,
        decoration: BoxDecoration(
          color: Color(0x907ABE80).withOpacity(opacity),
          border: border,
        ),
        child: Align(
          alignment: Alignment(0, 0.8),
          child: icon,
        ),
      ),
    );
  }
}

class BarUnit extends StatelessWidget {
  final String title;
  final double opacity;

  BarUnit({this.opacity, this.title});

  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: 200),
      child: Container(
        height: 120,
        width: 53,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Align(
          alignment: Alignment(0, 0.8),
          child: Text(
            '$title',
            style: TextStyle(color: Color(0xFF005E84)),
          ),
        ),
      ),
    );
  }
}
