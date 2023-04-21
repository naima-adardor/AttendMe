import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({super.key});

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Padding(
          padding: EdgeInsets.only(left: screenSize.width * 0.16),
          child: Text(
            'View Profile',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromARGB(255, 133, 118, 118),
              fontSize: screenSize.width * 0.05,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 133, 118, 118)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.width * 0.02),
          child: Center(
            child: Column(
              children: [
                Gap(
                  screenSize.height * 0.04,
                ),
                CircleAvatar(
                  radius: screenSize.height * 0.13,
                  backgroundImage: const AssetImage("assets/profile.jpg"),
                ),
                Gap(screenSize.height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.02,
                    vertical: screenSize.height * 0.03,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person_pin_rounded,
                            color: Color(0xFF6096B4),
                          ),
                          Gap(screenSize.width * 0.03),
                          Text(
                            "Full Name : ",
                            style: TextStyle(
                              color: const Color(0xFF6096B4),
                              fontSize: screenSize.width * 0.045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(screenSize.width * 0.03),
                          Text(
                            "ELJID Naima",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: screenSize.width * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Gap(screenSize.height * 0.02),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6096B4).withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      Gap(screenSize.height * 0.02),
                      Row(
                        children: [
                          const Icon(
                            Icons.email,
                            color: Color(0xFF6096B4),
                          ),
                          Gap(screenSize.width * 0.03),
                          Text(
                            "Email : ",
                            style: TextStyle(
                              color: const Color(0xFF6096B4),
                              fontSize: screenSize.width * 0.045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(screenSize.width * 0.03),
                          Text(
                            "naima.eljid03@gmail.com",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: screenSize.width * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Gap(screenSize.height * 0.02),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6096B4).withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      Gap(screenSize.height * 0.03),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone_rounded,
                            color: Color(0xFF6096B4),
                          ),
                          Gap(screenSize.width * 0.03),
                          Text(
                            "Phone number : ",
                            style: TextStyle(
                              color: const Color(0xFF6096B4),
                              fontSize: screenSize.width * 0.045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(screenSize.width * 0.03),
                          Text(
                            "06 25 67 89 09 ",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: screenSize.width * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Gap(screenSize.height * 0.02),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6096B4).withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      Gap(screenSize.height * 0.02),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Color(0xFF6096B4),
                          ),
                          Gap(screenSize.width * 0.03),
                          Text(
                            "Birthday : ",
                            style: TextStyle(
                              color: const Color(0xFF6096B4),
                              fontSize: screenSize.width * 0.045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(screenSize.width * 0.03),
                          Text(
                            "2003-02-27 ",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: screenSize.width * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Gap(screenSize.height * 0.02),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6096B4).withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      Gap(screenSize.height * 0.02),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xFF6096B4),
                          ),
                          Gap(screenSize.width * 0.03),
                          Text(
                            "Adress : ",
                            style: TextStyle(
                              color: const Color(0xFF6096B4),
                              fontSize: screenSize.width * 0.045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(screenSize.width * 0.03),
                          Text(
                            "Tilila, Agadir, Morocco ",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: screenSize.width * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Gap(screenSize.height * 0.02),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6096B4).withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
