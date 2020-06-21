import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterdiosample/functionality.dart';
import 'package:flutterdiosample/model/single_image_upload_model.dart';
import 'package:flutterdiosample/services/dio_services.dart';
import 'package:flutterdiosample/widget/widgets.dart';
import 'package:image_picker/image_picker.dart';

class SingleImageUploadScreen extends StatefulWidget {
  @override
  _SingleImageUploadScreenState createState() =>
      _SingleImageUploadScreenState();
}

class _SingleImageUploadScreenState extends State<SingleImageUploadScreen>
    with Functionality {
  final ImagePicker _picker = ImagePicker();
  PickedFile pickedFile;

  String imageUrl = "";

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
                      SingleImageUploadModel response =
                          await DioServices.uploadImage(pickedFile.path);
                      _setValue(response);
                    }
                  })
            ],
          ),
          Expanded(child: Image.network(imageUrl)),
        ],
      ),
    );
  }

  void _setValue(SingleImageUploadModel response) {
    if (isValidObject(response) &&
        isValidObject(response.status) &&
        response.status == 1) {
      if (isValidObject(response.imageUrl)) {
        setState(() {
          this.imageUrl = response.imageUrl;
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
