import 'package:flutter/material.dart';
import 'package:flutterdiosample/data/dio_services.dart';
import 'package:flutterdiosample/widget/button_widget.dart';
import 'package:flutterdiosample/widget/text_form_field_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostCallFormDataScreen extends StatelessWidget {
  final TextEditingController noteController = new TextEditingController();
  final TextEditingController dateController = new TextEditingController();
  final TextEditingController priorityController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextFormFieldWidget("ENter Note", noteController),
              TextFormFieldWidget("Enter Date", dateController),
              TextFormFieldWidget("Enter Priority", priorityController),
              ButtonWidget("Submit", () {
                DioServices.addNoteFormData(noteController.text,
                        dateController.text, priorityController.text)
                    .then((snapshot) {
                  if (snapshot != null) {
                    if (snapshot.success == 1) {
                      if (snapshot.message != null) {
                        Fluttertoast.showToast(
                          msg: snapshot.message,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 1,
                        );
                      }
                    } else if (snapshot.success == 0) {
                      Fluttertoast.showToast(
                        msg: snapshot.message,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIos: 1,
                      );
                    } else if (snapshot.success == -1) {
                      Fluttertoast.showToast(
                        msg: snapshot.message,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIos: 1,
                      );
                    }
                  }
                });
              })
            ],
          ),
        ),
      ),
    );
  }
}
