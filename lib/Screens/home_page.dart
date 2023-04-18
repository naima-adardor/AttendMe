import 'package:attend_me/Screens/bottom_bar.dart';
import 'package:attend_me/Screens/history_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 144, 191, 216),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 27,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Adardor Naima",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 24, 94, 133),
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Welcome !",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 231, 229, 229),
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                  IconButton(
                    alignment: Alignment.topCenter,
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Color.fromARGB(255, 24, 94, 133),
                      size: 35,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => NotificationScreen(),
                      //   ),
                      // );
                    },
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 32, left: 130),
              child: const Text(
                "Today's Status",
                style: TextStyle(
                  fontFamily: "NexaBold",
                  fontSize: 18,
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
                        const Gap(6),
                        Container(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text: DateTime.now().day.toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(135, 255, 255, 255),
                                  fontSize: 14,
                                  fontFamily: "NexaBold",
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: DateFormat(' MMMM yyyy')
                                        .format(DateTime.now()),
                                    style: const TextStyle(
                                      color: Color.fromARGB(135, 255, 255, 255),
                                      fontSize: 14,
                                      fontFamily: "NexaBold",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        const Gap(6),
                        StreamBuilder(
                          stream: Stream.periodic(const Duration(seconds: 1)),
                          builder: (context, snapshot) {
                            return Container(
                              alignment: Alignment.center,
                              child: Text(
                                DateFormat('hh:mm:ss a').format(DateTime.now()),
                                style: const TextStyle(
                                  fontFamily: "NexaRegular",
                                  fontSize: 14,
                                  color: Color.fromARGB(135, 255, 255, 255),
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
              margin: const EdgeInsets.only(
                  top: 12, bottom: 32, left: 10, right: 10),
              height: 70,
              width: 320,
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
                      children: const [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "09:00",
                          style: TextStyle(
                            fontFamily: "NexaBold",
                            fontSize: 18,
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
                      children: const [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontFamily: "NexaRegular",
                            fontSize: 20,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "--/--",
                          style: TextStyle(
                            fontFamily: "NexaBold",
                            fontSize: 18,
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
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 30,
            ),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Card(
                    color: const Color.fromARGB(255, 78, 146, 163),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomBar(
                              initialIndex: 3,
                            ),
                          ),
                        );
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Gap(12),
                              Image.asset("assets/late.png"),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Late",
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "12 times",
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 207, 196, 196),
                                      fontSize: 16,
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
                  height: 150,
                  width: 150,
                  child: Card(
                    color: const Color.fromARGB(255, 199, 34, 136),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomBar(
                              initialIndex: 3,
                            ),
                          ),
                        );
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Gap(12),
                              Image.asset(
                                "assets/Absent.png",
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Absent",
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "2 times",
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 207, 196, 196),
                                      fontSize: 16,
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
                  height: 150,
                  width: 150,
                  child: Card(
                    color: const Color.fromARGB(255, 158, 80, 182),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomBar(
                              initialIndex: 3,
                            ),
                          ),
                        );
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Gap(12),
                              Image.asset(
                                "assets/WorkingHours.png",
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Working Hours",
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "20:45:00",
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 207, 196, 196),
                                      fontSize: 16,
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
                  height: 150,
                  width: 150,
                  child: Card(
                    color: const Color.fromARGB(255, 231, 89, 23),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomBar(
                              initialIndex: 3,
                            ),
                          ),
                        );
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Gap(12),
                              Image.asset(
                                "assets/OnTime.png",
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "OnTime",
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "19 times",
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 207, 196, 196),
                                      fontSize: 16,
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
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
