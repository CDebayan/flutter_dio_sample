import 'package:flutter/material.dart';
import 'package:flutterdiosample/functionality.dart';
import 'package:flutterdiosample/model/get_call_query_model.dart';
import 'package:flutterdiosample/services/dio_services.dart';
import 'package:flutterdiosample/widget/widgets.dart';

class GetCallQueryScreen extends StatefulWidget {
  @override
  _GetCallQueryScreenState createState() => _GetCallQueryScreenState();
}

class _GetCallQueryScreenState extends State<GetCallQueryScreen> with Functionality{
  String responseData = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(responseData),
            RaisedButton(
              child: Text("CLICK"),
              onPressed: () async {
                GetCallQueryModel response = await DioServices.getCallQuery("1","DC","24");
                _setValue(response);
              },
            ),
          ],
        ),
      ),
    );
  }
  void _setValue(GetCallQueryModel response) {
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
          responseData = "Id : $id, Name : $name, age : $age";
        });
      }
    } else {
      if (isValidString(response.message)) {
        showToast(message: response.message);
      }
    }
  }
}
