import 'package:flutter/material.dart';
import 'package:flutterdiosample/widget/button_widget.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class MultipleImageUploadScreen extends StatefulWidget {
  @override
  _MultipleImageUploadScreenState createState() =>
      _MultipleImageUploadScreenState();
}

class _MultipleImageUploadScreenState extends State<MultipleImageUploadScreen> {
  List<Asset> _selectedImages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ButtonWidget("Select Image", () async {
              var image = await MultiImagePicker.pickImages(
                maxImages: 300,
              );
              setState(() {
                _selectedImages = image;
              });
            }),
            Expanded(
              child: _selectedImages == null
                  ? Center(
                      child: Text('No Image Selected'),
                    )
                  : GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(_selectedImages.length, (index) {
                        Asset asset = _selectedImages[index];
                        return AssetThumb(
                          asset: asset,
                          width: 300,
                          height: 300,
                        );
                      }),
                    ),
            ),
            ButtonWidget("Upload Image", () async {

            }),
          ],
        ),
      ),
    );
  }
}
