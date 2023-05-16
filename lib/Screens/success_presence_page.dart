import 'package:attend_me/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Presence.dart';
import '../models/api-response.dart';
import '../services/presence_services.dart';
import '../services/user-services.dart';
import 'Login_page.dart';

class SuccessPresencePage extends StatefulWidget {
  const SuccessPresencePage({super.key});

  @override
  State<SuccessPresencePage> createState() => _SuccessPresencePageState();
}

class _SuccessPresencePageState extends State<SuccessPresencePage> {
  int? userId;
  int? qrCodeId;
  String? checkIn;
  String? attendanceDay;
  Presence? presence;
  int? ID;

  //get ID presence
  Future<void> getIdP() async {
    ApiResponse response = await getIdPres(
      userId.toString(),
      qrCodeId.toString(),
      checkIn.toString(),
      attendanceDay.toString(),
    );
    if (response.error == null) {
      if (response.data != null) {
        setState(() {
          presence = response.data as Presence; // Get the response data
          ID = presence!.id_presence;
          print(ID);
          updatePresence();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid presence data')),
        );
      }
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false,
            ),
          });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${response.error}')),
      );
    }
  }

  //update presence
  Future<void> updatePresence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    checkOut = prefs.getString('check_out');

    ApiResponse response = await updatePres(ID.toString(), checkOut.toString());

    if (response.error == null && mounted) {
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

  String? checkOut;

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('status', "checkIn");
    });
    super.initState();
    SharedPreferences.getInstance().then((prefs) async {
      await setSessionVariables(prefs);
      userId = prefs.getInt('user_id');
      qrCodeId = prefs.getInt('qr_code_id');
      checkIn = prefs.getString('check_in');
      attendanceDay = prefs.getString('attendance_day');

      getIdP(); // Call getIdP here
      // print(ID); // Print ID after getIdP has completed
      // await updatePresence();
    });
  }

  Future<void> setSessionVariables(SharedPreferences prefs) async {
    await prefs.setString(
        'check_out', DateFormat('HH:mm').format(DateTime.now()).toString());
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenSize.height * 0.18),
            Center(
              child: Image.asset(
                'assets/check.png',
                height: screenSize.height * 0.25,
              ),
            ),
            SizedBox(height: screenSize.height * 0.08),
            Padding(
              padding: EdgeInsets.only(
                  left: screenSize.width * 0.06,
                  right: screenSize.width * 0.06),
              child: Center(
                child: Text(
                  "Your attendance for today's session has been recorded. \n \n Thank you for using AttendMe !",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.055,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 32, 199, 135),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
