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
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: -50,
            top: -120,
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF6096B4),
                shape: BoxShape.circle,
                border: Border.all(
                  width: 200,
                  color: const Color(0xFF6096B4),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/loginQR.png"),
                    const Gap(3),
                    const Text(
                      "Welcome !",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6096B4),
                      ),
                    ),
                    const Gap(20),
                    TextFormField(
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
                    const Gap(15),
                    TextFormField(
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
                    const Gap(15),
                    Row(
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
                    const Gap(20),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6096B4),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35))),
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
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
        ],
      ),
    );
  }
}
