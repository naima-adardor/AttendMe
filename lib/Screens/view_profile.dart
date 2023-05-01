import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/constants.dart';
import '../models/User.dart';
import '../models/api-response.dart';
import '../services/user-services.dart';
import 'Login_page.dart';

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({super.key});

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  String fullName = "";
  String email = "";
  String phoneNumber = "";
  String birthday = "";
  String adress = "";
  String CIN = "";
  User? user;
  bool loading = true;

//User Information
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null && mounted) {
      setState(() {
        loading = false;
        user = response.data as User;
        fullName = "${user!.first_name}" + " " + "${user!.last_name}";
        email = user!.email ?? '';
        phoneNumber = user!.phone_number ?? '';
        birthday = user!.birthday ?? '';
        adress = user!.adress ?? '';
        CIN = user!.cin ?? '';
      });
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

  @override
  void initState() {
    // setState(() {
    getUser();
    // });
    super.initState();
  }

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
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    image: user?.avatar != null
                                        ? DecorationImage(
                                            image:
                                                NetworkImage('${user!.avatar}'),
                                            fit: BoxFit.cover,
                                          )
                                        : const DecorationImage(
                                            image:
                                                AssetImage('assets/user.png'),
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: ClipOval(
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.22,
                            decoration: BoxDecoration(
                              image: user?.avatar != null
                                  ? DecorationImage(
                                      image: NetworkImage('${user!.avatar}'),
                                      fit: BoxFit.cover,
                                    )
                                  : const DecorationImage(
                                      image: AssetImage('assets/user.png'),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
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
                                  Icons.person,
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
                                  fullName,
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
                                    color: const Color(0xFF6096B4)
                                        .withOpacity(0.4),
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
                                  email,
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
                                    color: const Color(0xFF6096B4)
                                        .withOpacity(0.4),
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
                                  phoneNumber,
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
                                    color: const Color(0xFF6096B4)
                                        .withOpacity(0.4),
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
                                  Icons.person_pin_rounded,
                                  color: Color(0xFF6096B4),
                                ),
                                Gap(screenSize.width * 0.03),
                                Text(
                                  "CIN : ",
                                  style: TextStyle(
                                    color: const Color(0xFF6096B4),
                                    fontSize: screenSize.width * 0.045,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Gap(screenSize.width * 0.03),
                                Text(
                                  CIN,
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
                                    color: const Color(0xFF6096B4)
                                        .withOpacity(0.4),
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
                                  birthday,
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
                                    color: const Color(0xFF6096B4)
                                        .withOpacity(0.4),
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
                                  adress,
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
                                    color: const Color(0xFF6096B4)
                                        .withOpacity(0.4),
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
