import 'package:flutter/material.dart';
import 'package:flutterdiosample/screen/post_call_body.dart';
import 'package:flutterdiosample/screen/post_call_form_data.dart';
import 'package:flutterdiosample/screen/single_image_upload_screen.dart';
import 'package:flutterdiosample/widget/button_widget.dart';

import 'get_call_screen.dart';
import 'multiple_image_upload_screen.dart';


class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ButtonWidget('Get Call', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetCallScreen()));
            }),
            ButtonWidget('Post Call Body', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostCallBodyScreen()));
            }),
            ButtonWidget('Post Call Form Data', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostCallFormDataScreen()));
            }),
            ButtonWidget('Multipart Single Image', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SingleImageUploadScreen()));
            }),

            ButtonWidget('Multipart Miltiple Image', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MultipleImageUploadScreen()));
            }),
          ],
        ),
      ),
    );
  }
}
