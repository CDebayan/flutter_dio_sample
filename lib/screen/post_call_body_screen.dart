import 'package:flutter/material.dart';
import 'package:flutterdiosample/functionality.dart';
import 'package:flutterdiosample/model/post_call_body_model.dart';
import 'package:flutterdiosample/services/dio_services.dart';
import 'package:flutterdiosample/widget/widgets.dart';

class PostCallBodyScreen extends StatefulWidget {
  @override
  _PostCallBodyScreenState createState() => _PostCallBodyScreenState();
}

class _PostCallBodyScreenState extends State<PostCallBodyScreen>
    with Functionality {
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
                PostCallBodyModel response = await DioServices.postCallBody(
                    PostCallStudent(id: 1, name: "DC", age: 21));
                    _setValue(response);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _setValue(PostCallBodyModel response) {
    if (isValidObject(response) &&
        isValidObject(response.status) &&
        response.status == 1) {
      if (isValidObject(response.student)) {
        String id = "";
        String name = "";
        String age = "";
        if (isValidObject(response.student.id)) {
          id = response.student.id.toString();
        }
        if (isValidString(response.student.name)) {
          name = response.student.name.toString();
        }
        if (isValidObject(response.student.age)) {
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
