import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterdiosample/data/dio_services.dart';
import 'package:flutterdiosample/widget/button_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SingleImageUploadScreen extends StatefulWidget {
  @override
  _SingleImageUploadScreenState createState() =>
      _SingleImageUploadScreenState();
}

class _SingleImageUploadScreenState extends State<SingleImageUploadScreen> {
  File _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ButtonWidget("Select Image", () async {
              var image =
                  await ImagePicker.pickImage(source: ImageSource.gallery);
              setState(() {
                _selectedImage = image;
              });
            }),
            Expanded(
              child: Center(
                child: _selectedImage == null
                    ? Text('No image selected.')
                    : Image.file(_selectedImage),
              ),
            ),
            ButtonWidget("Upload Image", () async {
              DioServices.uploadImage("Your extra field", _selectedImage.path).then((snapshot) {
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
                  }
                }
              });
            }),
          ],
        ),
      ),
    );
  }
}
