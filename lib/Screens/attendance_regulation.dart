import 'package:attend_me/Screens/attendance_issue.dart';
import 'package:attend_me/Screens/sanitary_issue.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AttendanceRegulation extends StatefulWidget {
  const AttendanceRegulation({super.key});

  @override
  State<AttendanceRegulation> createState() => _AttendanceRegulationState();
}

class _AttendanceRegulationState extends State<AttendanceRegulation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            'Attendance Regulation',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromARGB(255, 133, 118, 118)),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 133, 118, 118),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 40,
                  left: 10,
                  right: 10,
                ),
                child: Text(
                  "Please select the Issue \n That applies to your situation !",
                  style: TextStyle(
                    color: Color(0xFF6096B4),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 12, bottom: 32, left: 10, right: 10),
                    height: 150,
                    width: 320,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 144, 191, 216),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 144, 191, 216),
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.warning,
                          size: 70,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "You forgot to punch \n Or \n Technical problems",
                          style: TextStyle(
                            color: Color.fromARGB(255, 24, 94, 133),
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SanitaryPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 12, bottom: 32, left: 10, right: 10),
                    height: 150,
                    width: 320,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 144, 191, 216),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 144, 191, 216),
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.sick_rounded,
                          size: 70,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "You're absent because \n Of \n Illness",
                          style: TextStyle(
                            color: Color.fromARGB(255, 24, 94, 133),
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
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
