import 'package:flutter/material.dart';
import 'package:zenniz_serveToTarget/src/screens/lets_go.dart';

import 'screens/serve_to_target.dart';
import 'screens/nicely_done.dart';
import 'screens/results_screen.dart';
import 'screens/lets_go.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ServeToTarget(),
        '/lets_go': (context) => LetsGo(context),
        '/nicely_done': (context) => NicelyDone(),
        '/results': (context) => ResultsScreen(),
      },
    );
  }
}

