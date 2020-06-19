import 'package:flutter/material.dart';
import 'package:flutterdiosample/screen/get_call_list_screen.dart';
import 'package:flutterdiosample/screen/get_call_screen.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            RaisedButton(
              child: Text("GET CALL"),
              onPressed: () {
                nextActivity(context, GetCallScreen());
              },
            ),
            RaisedButton(
              child: Text("GET CALL LIST"),
              onPressed: () {
                nextActivity(context, GetCallListScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  void nextActivity(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
