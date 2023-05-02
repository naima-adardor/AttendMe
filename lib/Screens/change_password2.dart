import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:attend_me/Screens/profile_page.dart';

import '../models/api-response.dart';
import '../constants/constants.dart';
import '../services/user-services.dart';

class changePassword2Page extends StatefulWidget {
  const changePassword2Page({super.key});

  @override
  State<changePassword2Page> createState() => _changePassword2PageState();
}

class _changePassword2PageState extends State<changePassword2Page> {
  final formKey = GlobalKey<FormState>();
  // bool _isTappedPass = false;
  bool _hideText = true;
  // bool _isTappedPass2 = false;
  bool _hideText2 = true;
  // bool _isTappedPass3 = false;
  bool _hideText3 = true;

  void _updatePassword() async {
    ApiResponse response =
        await changePassword(_oldPassword.text, _newPassword.text);
    if (response.data != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.data}')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  TextEditingController _oldPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

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
                Gap(screenSize.height * 0.07),
                Text(
                  "Change your password ",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 110, 110, 110),
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(screenSize.height * 0),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.03,
                        vertical: screenSize.height * 0.03),
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            padding: EdgeInsets.all(screenSize.height * 0.035),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6096B4),
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 80,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 4),
                            child: Container(
                                height: 200,
                                width: 200,
                                child: Center(
                                    child: Image.asset("assets/newPass.png"))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(screenSize.height * 0),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenSize.width * 0.02,
                          right: screenSize.width * 0.02,
                          bottom: screenSize.height * 0.01),
                      child: Text(
                        " Your new password must be different from previously used password",
                        style: TextStyle(
                          fontSize: screenSize.width * 0.05,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 163, 158, 158),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Gap(screenSize.height * 0.02),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: TextFormField(
                    controller: _oldPassword,
                    validator: (value) =>
                        value!.isEmpty ? "Please enter a valid password" : null,
                    onTap: () {
                      // setState(() {
                      //   _isTappedPass = true;
                      // });
                    },
                    obscureText: _hideText,
                    decoration: InputDecoration(
                      labelText: " Old Password",
                      labelStyle: const TextStyle(
                        color: Color(0xFF6096B4),
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
                Gap(screenSize.height * 0.02),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: TextFormField(
                    controller: _newPassword,
                    validator: (value) => value!.isEmpty
                        ? "Please enter a valid password"
                        : (value == _oldPassword.text)
                            ? 'New password should be different'
                            : null,
                    onTap: () {
                      // setState(() {
                      //   _isTappedPass2 = true;
                      // });
                    },
                    obscureText: _hideText2,
                    decoration: InputDecoration(
                      labelText: "New Password",
                      labelStyle: const TextStyle(
                        color: Color(0xFF6096B4),
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
                          _hideText2 ? Icons.visibility_off : Icons.visibility,
                          color: const Color(0xFF6096B4),
                        ),
                        onPressed: () {
                          setState(() {
                            _hideText2 = !_hideText2;
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
                Gap(screenSize.height * 0.02),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: TextFormField(
                    controller: _confirmPassword,
                    validator: (value) => value!.isEmpty
                        ? "Please confirm your password"
                        : (value != _newPassword.text)
                            ? 'Passwords do not match'
                            : null,
                    onTap: () {
                      // setState(() {
                      //   _isTappedPass3 = true;
                      // });
                    },
                    obscureText: _hideText3,
                    decoration: InputDecoration(
                      labelText: "Confirm New Password",
                      labelStyle: const TextStyle(
                        color: Color(0xFF6096B4),
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
                          _hideText3 ? Icons.visibility_off : Icons.visibility,
                          color: const Color(0xFF6096B4),
                        ),
                        onPressed: () {
                          setState(() {
                            _hideText3 = !_hideText3;
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
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
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
                        _updatePassword();
                      }
                    },
                    child: Text(
                      "Save",
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
