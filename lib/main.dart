import 'package:flutter/material.dart';
import 'package:flutterdiosample/screen/home_page_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageScreen(),
      routes: {

      },
    );
  }
}
