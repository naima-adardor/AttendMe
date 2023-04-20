import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class DisplaySelfie extends StatefulWidget {
  DisplaySelfie(this.pictureFile,{super.key});
  XFile pictureFile;

  @override
  State<DisplaySelfie> createState() => _DisplaySelfieState();
}

class _DisplaySelfieState extends State<DisplaySelfie> {
  @override
  Widget build(BuildContext context) {
    File picture= File(widget.pictureFile.path);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Selfie'),
      ),
      body: Center(
        child: Image.file(picture),
      ),
    );
  }
}