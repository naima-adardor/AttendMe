import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SuccessPresencePage extends StatefulWidget {
  const SuccessPresencePage({super.key});

  @override
  State<SuccessPresencePage> createState() => _SuccessPresencePageState();
}

class _SuccessPresencePageState extends State<SuccessPresencePage> {
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
