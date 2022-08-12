import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wasteagram/exports.dart';

class CameraButton extends StatefulWidget {
  const CameraButton({Key? key}) : super(key: key);

  @override
  State<CameraButton> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Button with Camera icon',
      onTapHint: 'Directs you to upload an image',
      child: FloatingActionButton(onPressed: buttonPress, child: const Icon(Icons.camera_alt),
      )
    );
  }

  void buttonPress(){
    // Navigate to NewPostScreen with the image as an argument
    Navigator.of(context).pushNamed(NewPostScreen.routeName);
  }
}