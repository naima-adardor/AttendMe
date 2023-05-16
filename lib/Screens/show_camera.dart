import 'dart:async';
import 'dart:io';

import 'package:attend_me/Screens/qr_scanner_overlay.dart';
import 'package:attend_me/Screens/scan_page.dart';
import 'package:attend_me/constants/colors.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../models/User.dart';
import '../models/api-response.dart';
import '../services/user-services.dart';
import 'Login_page.dart';

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
    getUser();
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

  User? user;

  //User Information
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      setState(() {
        user = response.data as User;
        SharedPreferences.getInstance().then((prefs) {
          prefs.setInt('user_id', user!.id!);
          prefs.setString('status', "checkIn");
        });
      });

      SharedPreferences.getInstance().then((prefs) {
        int? userId = prefs.getInt('user_id');
        String? status = prefs.getString('status');
        print(userId);
        print(status);
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Padding(
          padding: EdgeInsets.only(left: screenSize.height * 0.09),
          child: Text(
            'Taking a selfie',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: const Color.fromARGB(255, 133, 118, 118),
                fontSize: screenSize.width * 0.05),
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
        padding: EdgeInsets.all(screenSize.height * 0.02),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.03),
                child: Text(
                  "Place your face inside the frame",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.05,
                    fontWeight: FontWeight.w500,
                    color: maincolor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.025),
            Padding(
              padding: EdgeInsets.all(screenSize.height * 0.04),
              child: Center(
                child: SizedBox(
                  height: screenSize.height * 0.5,
                  width: screenSize.width * 0.7,
                  child: pictureFile != null
                      ? Image.file(File(pictureFile!.path))
                      : CameraPreview(controller),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenSize.height * 0.01),
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/close.png',
                    ),
                  ),
                ),
                SizedBox(width: screenSize.width * 0.02),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      pictureFile = await controller.takePicture();
                      setState(() {
                        SharedPreferences.getInstance().then((prefs) {
                          prefs.setString('image', pictureFile!.path);
                        });
                      });

                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => ScanPage()));
                    },
                    child: Image.asset(
                      'assets/done.png',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
