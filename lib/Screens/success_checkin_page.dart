import 'dart:io';

import 'package:attend_me/Screens/scan_page.dart';
import 'package:attend_me/Screens/success_presence_page.dart';
import 'package:attend_me/services/presence_services.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/constants.dart';
import '../models/api-response.dart';
import '../services/user-services.dart';
import 'Login_page.dart';
import 'package:qr/src/qr_image.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SucessCheckinPage extends StatefulWidget {
  final String code;
  // Extracting the id_qr_code

  final Function() closeScreen;
  const SucessCheckinPage(
      {super.key, required this.code, required this.closeScreen});

  @override
  State<SucessCheckinPage> createState() => _SucessCheckinPage();
}

String name = '';
String mission = '';

class _SucessCheckinPage extends State<SucessCheckinPage> {
  @override
  void initState() {
    super.initState();

    final List<String> lines = widget.code.split('\n');
    for (String line in lines) {
      if (line.startsWith('Name: ')) {
        name = line.substring('Name: '.length);
        print(name);
      } else if (line.startsWith('Mission: ')) {
        mission = line.substring('Mission: '.length);
        print(mission);
      }
    }

    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('status', "checkOut");
    });

    // Call the async function using then()
    SharedPreferences.getInstance().then((prefs) {
      setSessionVariables(prefs);
    });
  }

  void setSessionVariables(SharedPreferences prefs) async {
    final List<String> codeParts = widget.code.split('QR Code ID: ');
    final String idQrCode = codeParts.length > 1 ? codeParts[1] : '';
    await prefs.setInt('qr_code_id', int.parse(idQrCode));
    await prefs.setString(
        'check_in', DateFormat('HH:mm').format(DateTime.now()).toString());
    await prefs.setString('attendance_day',
        DateFormat('yyyy-MM-dd').format(DateTime.now()).toString());

    print(DateFormat('HH:mm').format(DateTime.now()).toString());
    print(DateFormat('yyyy-MM-dd').format(DateTime.now()).toString());

    await addPresence();
  }

  int? userId;
  int? qrCodeId;
  String? checkIn;
  String? attendanceDay;
  String? image;
  late int idPresence;
  Future<void> addPresence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('user_id');
    qrCodeId = prefs.getInt('qr_code_id');
    checkIn = prefs.getString('check_in');
    attendanceDay = prefs.getString('attendance_day');
    image = prefs.getString('image');
    // String imageUrl = 'file://' + image!;

    ApiResponse response = await addPres(
        qrCodeId.toString(),
        userId.toString(),
        checkIn.toString(),
        attendanceDay.toString(),
        await getBase64Image(image));

    if (response.error == null && mounted) {
      // Extract the id_presence from the response
      // idPresence = response.data!['id_presence'] ;
      // Store the id_presence in a session
      // SharedPreferences prefs = await SharedPreferences.getInstance();

      //prefs.setInt('id_presence', idPresence);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.data}')));

      // Navigator.pop(context);
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            if (mounted)
              {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false)
              }
          });
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response.error}')));
      }
    }
  }

  Future<String> getBase64Image(String? imagePath) async {
    if (imagePath == null) {
      return ''; // or return null, depending on your use case
    }

    File imageFile = File(imagePath);
    if (!imageFile.existsSync()) {
      return '';
    }

    List<int> bytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(bytes);

    return base64Image;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenSize.height * 0.08,
            ),
            Center(
              child: Image.asset(
                'assets/check.png',
                height: screenSize.height * 0.2,
              ),
            ),
            SizedBox(height: screenSize.height * 0.04),
            Padding(
              padding: EdgeInsets.only(
                left: screenSize.width * 0.05,
                right: screenSize.width * 0.05,
              ),
              child: Center(
                child: Text(
                  "You have successfully checked-in !",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 32, 199, 135),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Center(
              child: Text(
                "You are at : \n $name in the $mission !",
                style: TextStyle(
                  fontSize: screenSize.width * 0.045,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 57, 158, 119),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            QrImage(
              data: widget.code,
              size: screenSize.width * 0.4,
              version: QrVersions.auto,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: screenSize.height * 0.06,
                  right: screenSize.width * 0.07,
                  left: screenSize.width * 0.07),
              child: Row(
                children: [
                  Image.asset(
                    'assets/alert.png',
                    width: screenSize.width * 0.12,
                    height: screenSize.height * 0.1,
                  ),
                  SizedBox(width: screenSize.width * 0.06),
                  Flexible(
                    child: Text(
                      "To complete today's attendance record, please scan your QR code before leaving work.",
                      style: TextStyle(
                        fontSize: screenSize.width * 0.038,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 59, 59, 59),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenSize.height * 0.04,
                right: screenSize.width * 0.05,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScanPage(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/exit.png',
                    height: screenSize.height * 0.1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
