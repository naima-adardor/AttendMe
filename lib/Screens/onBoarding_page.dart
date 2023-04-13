import 'package:attend_me/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class onBoardingPage extends StatefulWidget {
  const onBoardingPage({super.key});

  @override
  State<onBoardingPage> createState() => _onBoardingPageState();
}

class _onBoardingPageState extends State<onBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Time-saving",
            body:
                "Attendance tracking using a mobile app is much faster compared to manual methods. The app can automatically record attendance as soon as an employee scans the QR code.",
            image: Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Image.asset("assets/save_time.png"),
            ),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Real-time data",
            body:
                "With a mobile app, attendance data is available in real-time, which allows supervisors to monitor attendance and take corrective actions immediately if necessary.",
            image: Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Image.asset("assets/real_time_data.png"),
            ),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Easy access to attendance records",
            body:
                "Employees can easily access their attendance records through the app, which makes it convenient for them to keep track of their attendance and ensure that their records are accurate.",
            image: Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Image.asset("assets/attendance_record.png"),
            ),
            decoration: getPageDecoration(),
          ),
        ],
        onDone: () {
          goToLogin(context);
        },
        showNextButton: true,
        next: const Text("Next",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF6096B4),
            )),
        showBackButton: false,
        showSkipButton: true,
        onSkip: () => goToLogin(context),
        skip: const Text("Skip",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF6096B4),
            )),
        done: const Text(
          "Join us !",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF6096B4),
          ),
        ),
        dotsDecorator: getDotDecoration(),
      ),
    );
  }

  void goToLogin(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: const Color.fromARGB(255, 173, 173, 173),
        activeColor: const Color(0xFF6096B4),
        size: const Size(10, 10),
        activeSize: const Size(15, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() {
    return PageDecoration(
      imageAlignment: Alignment.center,
      titleTextStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 17,
        color: Colors.grey[500],
      ),
      imagePadding: const EdgeInsets.only(
        top: 8,
      ),
    );
  }
}
