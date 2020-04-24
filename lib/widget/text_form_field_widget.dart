import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController noteController;
  TextFormFieldWidget(this.label,this.noteController);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: noteController,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
