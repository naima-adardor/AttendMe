import 'package:attend_me/Screens/bottom_bar.dart';
import 'package:attend_me/Screens/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _isTappedPass = false;
  bool _isTappedEmail = false;
  bool _hideText = true;
  bool _rememberMe = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
                Gap(screenSize.height * 0.05),
                Container(
                  height: screenSize.height * 0.4,
                  width: screenSize.width * 0.8,
                  child: Center(
                    child: Stack(
                      children: [
                        Image.asset("assets/loginQR.jpg"),
                      ],
                    ),
                  ),
                ),
                Text(
                  "Welcome !",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF6096B4),
                  ),
                ),
                Gap(screenSize.height * 0.06),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.07, vertical: 0),
                  child: TextFormField(
                    onTap: () {
                      setState(() {
                        _isTappedEmail = true;
                        _isTappedPass = false;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: _isTappedEmail
                            ? const Color(0xFF6096B4)
                            : const Color.fromARGB(255, 112, 112, 112),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF6096B4),
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF6096B4),
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color(0xFF6096B4),
                      ),
                    ),
                  ),
                ),
                const Gap(15),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.07, vertical: 0),
                  child: TextFormField(
                    onTap: () {
                      setState(() {
                        _isTappedPass = true;
                        _isTappedEmail = false;
                      });
                    },
                    obscureText: _hideText,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: _isTappedPass
                            ? const Color(0xFF6096B4)
                            : const Color.fromARGB(255, 112, 112, 112),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF6096B4),
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF6096B4),
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _hideText ? Icons.visibility_off : Icons.visibility,
                          color: const Color(0xFF6096B4),
                        ),
                        onPressed: () {
                          setState(() {
                            _hideText = !_hideText;
                          });
                        },
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFF6096B4),
                      ),
                    ),
                  ),
                ),
                Gap(screenSize.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.08, vertical: 0),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: const Color(0xFF6096B4),
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(
                            () {
                              _rememberMe = value!;
                            },
                          );
                        },
                      ),
                      const Expanded(
                        child: Text(
                          "Remember Me",
                          style: TextStyle(
                            color: Color.fromARGB(255, 148, 148, 148),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPassPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Forgot password ?",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(255, 148, 148, 148),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(screenSize.height * 0.04),
                SizedBox(
                  width: screenSize.width * 0.5,
                  height: screenSize.width * 0.13,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6096B4),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35))),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const BottomBar(
                            initialIndex: 0,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenSize.width * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
