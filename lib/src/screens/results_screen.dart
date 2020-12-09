import 'package:flutter/material.dart';
import 'package:zenniz_serveToTarget/src/widgets/action_button.dart';
import './serve_to_target.dart';
import '../widgets/serveData.dart';
import '../widgets/action_button.dart';

class ResultsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final PassedArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            title(),
            mainData(args),
            serveData(args),
            actions(context),
          ],
        ),
      ),
    );
  }

  Widget serveData(args) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ServeData(title: 'Average\nSpeed', data: '174 km/h', darkTheme: true,),
        Container(margin: EdgeInsets.all(20.0)),
        ServeData(title: 'Fastest\nSpeed', data: '181 km/h', darkTheme: true,),
        Container(margin: EdgeInsets.all(20.0)),
        ServeData(title: 'Serves\nIn', data: args.prob + '%', darkTheme: true,),
      ],
    );
  }

  Widget title() {
    return Container(
      child: Column(
        children: [
          Text(
            'Serve to target',
            style: TextStyle(
              color: Colors.black,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(margin: EdgeInsets.only(bottom: 10.0)),
          Text(
            'Results',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget mainData(args) {
    return Column(
      children: [
        Text(
          args.totalServes,
          style: TextStyle(
            color: Color(0xFF005E85),
            fontSize: 90,
          ),
        ),
        Text(
          'Serves',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ],
    );
  }

  Widget actions(context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomActionButton(
          title: 'RESTART',
          color: Color(0xFF00A2E9),
          textColor: Colors.white,
          onPressed: () => navigateBackToHome(context),
        ),
        Container(margin: EdgeInsets.all(20.0)),
        CustomActionButton(
          title: 'STATS',
          color: Colors.grey[100],
          textColor: Colors.black,
        ),
      ],
    );
  }

  navigateBackToHome(context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}
