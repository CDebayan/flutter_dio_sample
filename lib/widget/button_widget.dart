import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;

  ButtonWidget(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8,left: 8,right: 8),
      child: RaisedButton(
        child: Text(text),
        onPressed: onPressed,
      ),
    );
  }
}
