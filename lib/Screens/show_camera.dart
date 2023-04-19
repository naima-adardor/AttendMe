import 'dart:io';

import 'package:attend_me/Screens/display_selfie.dart';
import 'package:attend_me/Screens/qr_scanner_overlay.dart';
import 'package:attend_me/constants/colors.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraPage({this.cameras, Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
     final frontCamera = widget.cameras!.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    controller = CameraController(
      frontCamera,
      ResolutionPreset.max,
    );

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }
  

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
     return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      drawer:const Drawer() ,
      appBar: AppBar(
           iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Taking a selfie',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 133, 118, 118)),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 133, 118, 118)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 1,
        ),
        body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25),
    child:Column(
      children: [
         Center(
           child: Padding(
            padding: const EdgeInsets.only(top:30),
            child: 
                Text(
                  "Place your face inside the frame",
               style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: maincolor,
                        ),
                        textAlign: TextAlign.center,
                    ),
            
                 ),
         ),
        SizedBox(height:20),
      
        Padding(
          padding: const EdgeInsets.all(8.0),
    
          child: Center(
            child: SizedBox(
              height: 400,
              width: 400,
              child: CameraPreview(controller,
              ),
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              

    
             child: GestureDetector(
               
    
  
                
    onTap: () async {
               
                  setState(() {});
                  Navigator.pop(context);
                },
      // Handle image tap
    
    child: Image.asset(
      'assets/close.png',
    
    ),
                ),
               
              ),
              SizedBox(width:20),
              Padding(
              padding: const EdgeInsets.all(8.0),
              

    
             child: GestureDetector(
               
    
  
                
    onTap: () async {
               pictureFile = await controller.takePicture();
                  setState(() {});
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DisplaySelfie(pictureFile!)));
              
                },
      // Handle image tap
    
    child: Image.asset(
      'assets/done.png',
    
    ),
                ),
               
              ),
            
           
          ],
        ),
       
          //Android/iOS
          // Image.file(File(pictureFile!.path)))
      ],
    ),
        ),
    );
  }
}