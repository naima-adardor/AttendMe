import 'package:attend_me/Screens/login_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6096B4),
      body: Stack(
        children: [
          Positioned(
            left: -163,
            top: -160,
            child: Container(
              padding: const EdgeInsets.all(164),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 5,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          Positioned(
            left: -180,
            top: -180,
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                shape: BoxShape.circle,
                border: Border.all(
                  width: 145,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            right: -171,
            bottom: -171,
            child: Container(
              padding: const EdgeInsets.all(164),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 5,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          Positioned(
            right: -190,
            bottom: -190,
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                shape: BoxShape.circle,
                border: Border.all(
                  width: 145,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 160),
            child: Column(
              children: [
                Image.asset("assets/AttendMeS.png"),
                const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
