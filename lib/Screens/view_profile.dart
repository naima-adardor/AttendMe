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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Padding(
          padding: EdgeInsets.only(left: 55),
          child: Text(
            'View Profile',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromARGB(255, 133, 118, 118)),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              children: [
                const Gap(30),
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 40,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.person_pin_rounded,
                            color: Color(0xFF6096B4),
                          ),
                          Gap(10),
                          Text(
                            "Full Name : ",
                            style: TextStyle(
                              color: Color(0xFF6096B4),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(10),
                          Text(
                            "ELJID Naima",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
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
                      const Gap(10),
                      Row(
                        children: const [
                          Icon(
                            Icons.email,
                            color: Color(0xFF6096B4),
                          ),
                          Gap(10),
                          Text(
                            "Email : ",
                            style: TextStyle(
                              color: Color(0xFF6096B4),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(10),
                          Text(
                            "naima.eljid03@gmail.com",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
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
                      const Gap(10),
                      Row(
                        children: const [
                          Icon(
                            Icons.phone_rounded,
                            color: Color(0xFF6096B4),
                          ),
                          Gap(10),
                          Text(
                            "Phone number : ",
                            style: TextStyle(
                              color: Color(0xFF6096B4),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(10),
                          Text(
                            "06 25 67 89 09 ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
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
                      const Gap(10),
                      Row(
                        children: const [
                          Icon(
                            Icons.calendar_month,
                            color: Color(0xFF6096B4),
                          ),
                          Gap(10),
                          Text(
                            "Birthday : ",
                            style: TextStyle(
                              color: Color(0xFF6096B4),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(10),
                          Text(
                            "27/02/2003 ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
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
                      const Gap(10),
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            color: Color(0xFF6096B4),
                          ),
                          Gap(10),
                          Text(
                            "Adress : ",
                            style: TextStyle(
                              color: Color(0xFF6096B4),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(10),
                          Text(
                            "Tilila, Agadir, Morocco ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
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
                      const Gap(10),
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
