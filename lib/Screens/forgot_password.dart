import 'package:attend_me/Screens/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/constants.dart';
import '../models/api-response.dart';
import '../services/user-services.dart';
import 'Login_page.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  //Send OTP
  // void sendOTP() async {
  //   ApiResponse response = await sendOtp(
  //     _phone.text,
  //   );

  //   if (response.error == null && mounted) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('OTP sent')),
  //     );
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const VerificationPage()),
  //     );
  //   } else {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(response.error ?? 'Unknown error')),
  //       );
  //     }
  //   }
  // }

  final formKey = GlobalKey<FormState>();
  TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Padding(
            padding: EdgeInsets.only(left: screenSize.width * 0.15),
            child: Text(
              'Forgot Password',
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
              horizontal: screenSize.width * 0,
              vertical: screenSize.height * 0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Gap(screenSize.height * 0),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.05,
                        vertical: screenSize.height * 0.05),
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
                                horizontal: 20, vertical: 30),
                            child: Container(
                                height: 179,
                                width: 170,
                                child: Center(
                                    child:
                                        Image.asset("assets/forgotPass.png"))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.07,
                      vertical: screenSize.height * 0.01),
                  child: Text(
                    "Please enter your Number Phone to receive a verification code",
                    style: TextStyle(
                      fontSize: screenSize.width * 0.045,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 88, 84, 84),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(screenSize.height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.05, vertical: 0),
                  child: TextFormField(
                    controller: _phone,
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 112, 112, 112),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 141, 141, 141),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 141, 141, 141),
                      ),
                    ),
                  ),
                ),
                Gap(screenSize.height * 0.06),
                SizedBox(
                  width: screenSize.width * 0.5,
                  height: screenSize.height * 0.07,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6096B4),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35))),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // sendOTP();
                      }
                    },
                    child: Text(
                      "Send",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenSize.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
