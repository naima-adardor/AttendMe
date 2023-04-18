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
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 12, bottom: 32, left: 10, right: 10),
                  height: 60,
                  width: 320,
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
                    children: const [
                      Gap(20),
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      Gap(20),
                      Text(
                        "ELJID Naima",
                        style: TextStyle(
                            color: Color.fromARGB(255, 24, 94, 133),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(15),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Center(
                  child: Text(
                    "Mark your attendance first by scanning the QR Code in the elevator",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Gap(35),
              Image.asset("assets/scan.png"),
              const Gap(40),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 60,
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
                  child: const Text(
                    "If you encounter any issues, please contact our support team for assistance !",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromARGB(255, 148, 148, 148),
                      fontSize: 15,
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
