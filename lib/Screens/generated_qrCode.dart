import 'package:attend_me/Screens/attendance_regulation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class QrCodeGeneratedPage extends StatefulWidget {
  const QrCodeGeneratedPage({super.key});

  @override
  State<QrCodeGeneratedPage> createState() => _QrCodeGeneratedPageState();
}

class _QrCodeGeneratedPageState extends State<QrCodeGeneratedPage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.06,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    top: screenSize.height * 0.02,
                    bottom: screenSize.height * 0.02,
                    left: screenSize.width * 0.05,
                    right: screenSize.width * 0.05,
                  ),
                  height: screenSize.height * 0.08,
                  width: screenSize.width * 0.86,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 229, 229),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(66, 102, 102, 102),
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    children: [
                      Gap(screenSize.width * 0.04),
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      Gap(screenSize.height * 0.04),
                      Text(
                        "ELJID Naima",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 24, 94, 133),
                            fontSize: screenSize.width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(screenSize.height * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.07,
                ),
                child: Center(
                  child: Text(
                    "Mark your attendance first by scanning the QR Code in the elevator",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenSize.width * 0.05,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Gap(screenSize.height * 0.05),
              Image.asset("assets/scan.png"),
              Gap(screenSize.height * 0.05),
              Padding(
                padding: EdgeInsets.only(
                  right: screenSize.width * 0.05,
                  left: screenSize.width * 0.09,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AttendanceRegulation(),
                      ),
                    );
                  },
                  child: Text(
                    "If you encounter any issues, please contact our support team for assistance !",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: const Color.fromARGB(255, 148, 148, 148),
                      fontSize: screenSize.width * 0.040,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
