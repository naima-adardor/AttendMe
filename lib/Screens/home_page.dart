import 'package:attend_me/Screens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../models/User.dart';
import '../models/api-response.dart';
import '../services/presence_services.dart';
import '../services/user-services.dart';
import 'Login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fullName = "";
  User? user;
  String? statusCheckIn;
  String? statusCheckOut;
  String? checkIn;
  String? checkOut;

//User Information
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null && mounted) {
      setState(() {
        user = response.data as User;
        fullName = "${user!.first_name}" + " " + "${user!.last_name}";
      });
      fetchData();
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

  List<Map<String, dynamic>> counts = [];

  Future<void> fetchData() async {
    try {
      List<Map<String, dynamic>> fetchedPresenceList =
          await getPresenceByIdEmpDashboard(user!.id!);

      setState(() {
        counts = fetchedPresenceList;
        print(counts[0]['late']);
        print(counts[0]['absent']);
        print(counts[0]['onTime']);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    setState(() {
      getUser();
    });
    super.initState();
    SharedPreferences.getInstance().then((prefs) async {
      await getSessionVariables(prefs);
    });
  }

  Future<void> getSessionVariables(SharedPreferences prefs) async {
    setState(() {
      statusCheckIn = prefs.getString('setCheckIn');
      statusCheckOut = prefs.getString('setCheckOut');
      checkIn = prefs.getString('check_in');
      checkOut = prefs.getString('check_out');
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 144, 191, 216),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenSize.width * 0.06,
                right: screenSize.width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ClipOval(
                    child: Container(
                      width: screenSize.width * 0.16,
                      height: screenSize.height * 0.08,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        fullName,
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: const Color.fromARGB(255, 24, 94, 133),
                            fontSize: screenSize.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Welcome !",
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: const Color.fromARGB(255, 231, 229, 229),
                            fontSize: screenSize.width * 0.034,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    alignment: Alignment.topCenter,
                    icon: Icon(
                      Icons.fiber_manual_record,
                      color: Color.fromARGB(255, 57, 206, 11),
                      size: screenSize.height * 0.034,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: screenSize.height * 0.04,
                left: screenSize.width * 0,
              ),
              child: Text(
                "Latest Session",
                style: TextStyle(
                  fontFamily: "NexaBold",
                  fontSize: screenSize.width * 0.05,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Gap(screenSize.height * 0.01),
                        Container(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text: DateTime.now().day.toString(),
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(135, 255, 255, 255),
                                  fontSize: screenSize.width * 0.04,
                                  fontFamily: "NexaBold",
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: DateFormat(' MMMM yyyy')
                                        .format(DateTime.now()),
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                          135, 255, 255, 255),
                                      fontSize: screenSize.width * 0.04,
                                      fontFamily: "NexaBold",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(width: screenSize.width * 0.02),
                    Column(
                      children: [
                        Gap(screenSize.height * 0.01),
                        StreamBuilder(
                          stream: Stream.periodic(const Duration(seconds: 1)),
                          builder: (context, snapshot) {
                            return Container(
                              alignment: Alignment.center,
                              child: Text(
                                DateFormat('hh:mm:ss a').format(DateTime.now()),
                                style: TextStyle(
                                  fontFamily: "NexaRegular",
                                  fontSize: screenSize.width * 0.04,
                                  color:
                                      const Color.fromARGB(135, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: screenSize.height * 0.025,
                bottom: screenSize.height * 0.025,
                left: screenSize.width * 0.04,
                right: screenSize.width * 0.04,
              ),
              height: screenSize.height * 0.09,
              width: screenSize.width * 0.73,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: screenSize.width * 0.05,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          statusCheckIn == "yes" ? checkIn! : "--/--",
                          style: TextStyle(
                            fontFamily: "NexaBold",
                            fontSize: screenSize.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: screenSize.width * 0.05,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          statusCheckOut == "yes" ? checkOut! : "--/--",
                          style: TextStyle(
                            fontFamily: "NexaBold",
                            fontSize: screenSize.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Monthly Presence Summary",
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: screenSize.width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            Wrap(
              spacing: screenSize.width * 0.02,
              runSpacing: screenSize.height * 0.015,
              children: [
                SizedBox(
                  height: screenSize.height * 0.205,
                  width: screenSize.height * 0.2,
                  child: Card(
                    color: const Color.fromARGB(255, 199, 34, 136),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Gap(screenSize.height * 0.01),
                              Image.asset(
                                "assets/Absent.png",
                                height: screenSize.height * 0.07,
                                width: screenSize.width * 0.11,
                              ),
                              SizedBox(
                                height: screenSize.height * 0.01,
                              ),
                              Text(
                                "Absent",
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontSize: screenSize.width * 0.04,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: screenSize.height * 0.003,
                              ),
                              Text(
                                counts.isNotEmpty
                                    ? counts[0]['absent'].toString()
                                    : 'N/A',
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 207, 196, 196),
                                      fontSize: screenSize.width * 0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.205,
                  width: screenSize.height * 0.2,
                  child: Card(
                    color: const Color.fromARGB(255, 158, 80, 182),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Gap(screenSize.height * 0.01),
                              Image.asset(
                                "assets/WorkingHours.png",
                                height: screenSize.height * 0.07,
                                width: screenSize.width * 0.13,
                              ),
                              SizedBox(
                                height: screenSize.height * 0.01,
                              ),
                              Text(
                                "All Presences",
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontSize: screenSize.width * 0.037,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: screenSize.height * 0.003,
                              ),
                              Text(
                                counts.isNotEmpty
                                    ? '${counts[0]['late'] + counts[0]['onTime']}'
                                    : 'N/A',
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 207, 196, 196),
                                      fontSize: screenSize.width * 0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.205,
                  width: screenSize.height * 0.2,
                  child: Card(
                    color: const Color.fromARGB(255, 78, 146, 163),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Gap(screenSize.height * 0.01),
                              Image.asset("assets/late.png"),
                              SizedBox(
                                height: screenSize.height * 0.01,
                              ),
                              Text(
                                "Late",
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontSize: screenSize.width * 0.04,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: screenSize.height * 0.003,
                              ),
                              Text(
                                counts.isNotEmpty
                                    ? counts[0]['late'].toString()
                                    : 'N/A',
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 207, 196, 196),
                                      fontSize: screenSize.width * 0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.205,
                  width: screenSize.height * 0.2,
                  child: Card(
                    color: const Color.fromARGB(255, 231, 89, 23),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Gap(screenSize.height * 0.01),
                              Image.asset(
                                "assets/OnTime.png",
                                height: screenSize.height * 0.07,
                                width: screenSize.width * 0.13,
                              ),
                              SizedBox(
                                height: screenSize.height * 0.01,
                              ),
                              Text(
                                "OnTime",
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontSize: screenSize.width * 0.04,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: screenSize.height * 0.003,
                              ),
                              Text(
                                counts.isNotEmpty
                                    ? counts[0]['onTime'].toString()
                                    : 'N/A',
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 207, 196, 196),
                                      fontSize: screenSize.width * 0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
