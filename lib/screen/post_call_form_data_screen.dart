import 'package:flutter/material.dart';
import 'package:flutterdiosample/functionality.dart';
import 'package:flutterdiosample/model/post_call_form_data_model.dart';
import 'package:flutterdiosample/services/dio_services.dart';
import 'package:flutterdiosample/widget/widgets.dart';

class PostCallFormDataScreen extends StatefulWidget {
  @override
  _PostCallFormDataScreenState createState() => _PostCallFormDataScreenState();
}

class _PostCallFormDataScreenState extends State<PostCallFormDataScreen>
    with Functionality {
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
                PostCallFormDataModel response = await DioServices.postCallFormData("1","DC","23");
                _setValue(response);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _setValue(PostCallFormDataModel response) {
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
