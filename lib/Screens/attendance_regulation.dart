import 'package:attend_me/Screens/attendance_issue.dart';
import 'package:attend_me/Screens/sanitary_issue.dart';
import 'package:flutter/material.dart';

class AttendanceRegulation extends StatefulWidget {
  const AttendanceRegulation({super.key});

  @override
  State<AttendanceRegulation> createState() => _AttendanceRegulationState();
}

class _AttendanceRegulationState extends State<AttendanceRegulation> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Padding(
          padding: EdgeInsets.only(
            left: screenSize.width * 0.08,
            right: screenSize.width * 0.08,
          ),
          child: Text(
            'Attendance Regulation',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenSize.width * 0.05,
              color: const Color.fromARGB(
                255,
                133,
                118,
                118,
              ),
            ),
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
              Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.06,
                  left: screenSize.width * 0.06,
                  right: screenSize.width * 0.06,
                ),
                child: Text(
                  "Please select the Issue \n That applies to your situation !",
                  style: TextStyle(
                    color: const Color(0xFF6096B4),
                    fontSize: screenSize.width * 0.052,
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
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.05,
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: screenSize.height * 0.015,
                      bottom: screenSize.height * 0.01,
                      left: screenSize.width * 0.06,
                      right: screenSize.width * 0.06,
                    ),
                    height: screenSize.height * 0.19,
                    width: screenSize.width * 0.9,
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
                      children: [
                        SizedBox(
                          width: screenSize.width * 0.06,
                        ),
                        Icon(
                          Icons.warning,
                          size: screenSize.width * 0.2,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: screenSize.width * 0.05,
                        ),
                        Text(
                          "You forgot to punch \n Or \n Technical problems",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 24, 94, 133),
                            fontSize: screenSize.width * 0.05,
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
                  padding: EdgeInsets.only(
                    bottom: screenSize.height * 0.05,
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: screenSize.height * 0.025,
                      bottom: screenSize.height * 0.015,
                      left: screenSize.width * 0.06,
                      right: screenSize.width * 0.06,
                    ),
                    height: screenSize.height * 0.19,
                    width: screenSize.width * 0.9,
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
                      children: [
                        SizedBox(
                          width: screenSize.width * 0.04,
                        ),
                        Icon(
                          Icons.sick_rounded,
                          size: screenSize.width * 0.2,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: screenSize.width * 0.05,
                        ),
                        Text(
                          "You're absent because \n Of \n Illness",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 24, 94, 133),
                            fontSize: screenSize.width * 0.05,
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
