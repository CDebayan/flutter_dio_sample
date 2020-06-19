import 'package:flutter/material.dart';
import 'package:flutterdiosample/functionality.dart';
import 'package:flutterdiosample/model/get_call_path_model.dart';
import 'package:flutterdiosample/services/dio_services.dart';
import 'package:flutterdiosample/widget/widgets.dart';

class GetCallPathScreen extends StatefulWidget {
  @override
  _GetCallPathScreenState createState() => _GetCallPathScreenState();
}

class _GetCallPathScreenState extends State<GetCallPathScreen> with Functionality{
  String responseDate = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(responseDate),
            RaisedButton(
              child: Text("CLICK"),
              onPressed: () async {
                GetCallPathModel response = await DioServices.getCallPath(1,"DC",24);
                _setValue(response);
              },
            ),
          ],
        ),
      ),
    );
  }
  void _setValue(GetCallPathModel response) {
    if (isValidObject(response) &&
        isValidObject(response.status) &&
        response.status == 1) {
      if (isValidObject(response.student)) {
        String id = "";
        String name = "";
        String age = "";
        if (isValidString(response.student.id)) {
          id = response.student.id.toString();
        }
        if (isValidString(response.student.name)) {
          name = response.student.name.toString();
        }
        if (isValidString(response.student.age)) {
          age = response.student.age.toString();
        }

        setState(() {
          responseDate = "Id : $id, Name : $name, age : $age";
        });
      }
    } else {
      if (isValidString(response.message)) {
        showToast(message: response.message);
      }
    }
  }
}
