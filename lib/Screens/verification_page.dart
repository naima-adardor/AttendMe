import 'package:attend_me/Screens/change_password.dart';
import 'package:attend_me/Screens/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../models/api-response.dart';
import '../services/user-services.dart';

class VerificationPage extends StatefulWidget {
  final String email;

  const VerificationPage({
    super.key,
    required this.email,
  });

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  //resend otp code
  void sendOTP() async {
    ApiResponse response = await sendOtp(
      widget.email,
    );

    if (response.error == null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${response.data}')),
      );
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${response.error}')),
        );
      }
    }
  }

  //verify OTP
  void verify() async {
    ApiResponse response = await verifyOtp(widget.email, _otp);

    if (response.error == null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${response.data}')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangePasswordPage(email: widget.email)),
      );
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${response.error}')),
        );
      }
    }
  }

  late String _otp = '';

  @override
  void initState() {
    super.initState();
    _otpController1 = TextEditingController();
    _otpController2 = TextEditingController();
    _otpController3 = TextEditingController();
    _otpController4 = TextEditingController();
  }

  late final TextEditingController _otpController1;
  late final TextEditingController _otpController2;
  late final TextEditingController _otpController3;
  late final TextEditingController _otpController4;

  // final _otp =
  // '${_otpController1.text}${_otpController2.text}${_otpController3.text}${_otpController4.text}';

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Gap(screenSize.height * 0.086),
                Text(
                  "Verification Code !  ",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 110, 110, 110),
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(screenSize.height * 0.01),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.02,
                        vertical: screenSize.height * 0.02),
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            padding: EdgeInsets.all(screenSize.height * 0.03),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6096B4),
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 100,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 20),
                            child: Container(
                                height: 210,
                                width: 210,
                                child: Center(
                                    child: Image.asset(
                                        "assets/verification.png"))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(screenSize.height * 0.01),
                Column(
                  children: [
                    Text(
                      "Please enter the 4 code sent to  ",
                      style: TextStyle(
                        fontSize: screenSize.width * 0.048,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 88, 84, 84),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Gap(screenSize.height * 0.006),
                    Text(
                      widget.email,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.046,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 88, 84, 84),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.03,
                      vertical: screenSize.height * 0),
                ),
                Gap(screenSize.height * 0),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(
                        right: screenSize.width * 0.15,
                        left: screenSize.width * 0.15,
                        top: screenSize.height * 0.03,
                        bottom: screenSize.height * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _textFieldOTP(
                                    controller: _otpController1,
                                    first: true,
                                    last: false),
                                _textFieldOTP(
                                    controller: _otpController2,
                                    first: false,
                                    last: false),
                                _textFieldOTP(
                                    controller: _otpController3,
                                    first: false,
                                    last: false),
                                _textFieldOTP(
                                    controller: _otpController4,
                                    first: false,
                                    last: true),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                SizedBox(
                  width: screenSize.width * 0.5,
                  height: screenSize.height * 0.072,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6096B4),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35))),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        verify();
                      }
                    },
                    child: Text(
                      "Verify",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenSize.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPassPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Change Email",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: const Color.fromARGB(255, 148, 148, 148),
                        fontSize: screenSize.width * 0.04,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    sendOTP();
                  },
                  child: Text(
                    "Resend New Code",
                    style: TextStyle(
                      fontSize: screenSize.width * 0.045,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF6096B4),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  Widget _textFieldOTP(
      {required TextEditingController controller,
      required bool first,
      required bool last}) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        width: 50,
        height: 60,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: TextField(
            controller: controller,
            autofocus: true,
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.length == 0 && first == false) {
                FocusScope.of(context).previousFocus();
              }
              setState(() {
                _otp = _otpController1.text +
                    _otpController2.text +
                    _otpController3.text +
                    _otpController4.text;
              });
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counter: SizedBox.shrink(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black12),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: const Color(0xFF6096B4)),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ),
    );
  }
}
