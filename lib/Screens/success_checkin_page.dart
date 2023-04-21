import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SucessCheckinPage extends StatelessWidget {
  final String code;
  final Function() closeScreen;
  const SucessCheckinPage(
      {super.key, required this.code, required this.closeScreen});

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
                "You are at elevator $code !",
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
                data: code,
                size: screenSize.width * 0.4,
                version: QrVersions.auto),
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
                      "To complete today's attendance record,please scan your QR code before leaving work .",
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
                  onTap: () {},
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
