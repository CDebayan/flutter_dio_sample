import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterdiosample/functionality.dart';
import 'package:flutterdiosample/model/single_image_upload_with_data.dart';
import 'package:flutterdiosample/services/dio_services.dart';
import 'package:flutterdiosample/widget/widgets.dart';
import 'package:image_picker/image_picker.dart';

class SingleImageUploadWithDataScreen extends StatefulWidget {
  @override
  _SingleImageUploadWithDataScreenState createState() =>
      _SingleImageUploadWithDataScreenState();
}

class _SingleImageUploadWithDataScreenState
    extends State<SingleImageUploadWithDataScreen> with Functionality {
  final ImagePicker _picker = ImagePicker();
  PickedFile pickedFile;
  String imageUrl = "";
  String responseData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: pickedFile != null
                  ? Image.file(File(pickedFile.path ?? ""))
                  : Center(
                      child: Text("Image"),
                    )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                  child: Text("Select Image"),
                  onPressed: () {
                    _bottomSheet();
                  }),
              RaisedButton(
                  child: Text("Upload Image"),
                  onPressed: () async {
                    if (isValidObject(pickedFile)) {
                      SingleImageUploadWithDataModel response =
                          await DioServices.uploadImageWithData(
                              pickedFile.path, "DC", "23");
                      _setValue(response);
                    }
                  })
            ],
          ),
          Expanded(child: Image.network(imageUrl)),
          Text(responseData),
        ],
      ),
    );
  }

  void _setValue(SingleImageUploadWithDataModel response) {
    if (isValidObject(response) &&
        isValidObject(response.status) &&
        response.status == 1) {
      if (isValidObject(response.student)) {
        String name = "";
        String age = "";
        if (isValidString(response.student.name)) {
          name = response.student.name.toString();
        }
        if (isValidObject(response.student.age)) {
          age = response.student.age.toString();
        }
        if (isValidString(response.student.imageUrl)) {
          imageUrl = response.student.imageUrl;
        }

        setState(() {
          this.imageUrl = response.student.imageUrl;
          responseData = "Name : $name, age : $age";
        });
      }
    } else {
      if (isValidString(response.message)) {
        showToast(message: response.message);
      }
    }
  }

  void _bottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('Camera'),
                    onTap: () async {
                      Navigator.of(context).pop();
                      pickedFile =
                          await _picker.getImage(source: ImageSource.camera);
                      setState(() {});
                    }),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Gallery'),
                  onTap: () async {
                    Navigator.of(context).pop();
                    pickedFile =
                        await _picker.getImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        });
  }
}
