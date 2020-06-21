import 'package:flutter/material.dart';
import 'package:flutterdiosample/screen/get_call_list_screen.dart';
import 'package:flutterdiosample/screen/get_call_path_screen.dart';
import 'package:flutterdiosample/screen/get_call_query_screen.dart';
import 'package:flutterdiosample/screen/get_call_screen.dart';
import 'package:flutterdiosample/screen/post_call_body_screen.dart';
import 'package:flutterdiosample/screen/post_call_form_data_screen.dart';

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
            RaisedButton(
              child: Text("GET CALL PATH"),
              onPressed: () {
                nextActivity(context, GetCallPathScreen());
              },
            ),
            RaisedButton(
              child: Text("GET CALL QUERY"),
              onPressed: () {
                nextActivity(context, GetCallQueryScreen());
              },
            ),
            RaisedButton(
              child: Text("POST CALL BODY"),
              onPressed: () {
                nextActivity(context, PostCallBodyScreen());
              },
            ),
            RaisedButton(
              child: Text("POST CALL FORM DATA"),
              onPressed: () {
                nextActivity(context, PostCallFormDataScreen());
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
