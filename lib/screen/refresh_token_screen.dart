import 'package:flutter/material.dart';
import 'package:flutterdiosample/data/dio_services.dart';
import 'package:flutterdiosample/widget/button_widget.dart';

class RefreshTokenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonWidget("Refresh Token", () async{
         await as();

        }),
      ),
    );
  }

  Future as() async {
    var refreshToken =await DioServices.refreshToken("data");
    if(refreshToken.success == 403){
      as();
    }else{
      print(refreshToken);
    }

  }
}
