import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/constants.dart';
import '../models/User.dart';
import '../models/api-response.dart';
import '../services/sanitary_issues_services.dart';
import '../services/user-services.dart';
import 'Login_page.dart';

class SanitaryPage extends StatefulWidget {
  const SanitaryPage({super.key});

  @override
  State<SanitaryPage> createState() => _SanitaryPageState();
}

class _SanitaryPageState extends State<SanitaryPage> {
  User? user;

//User Information
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null && mounted) {
      setState(() {
        user = response.data as User;
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

//Add Attendance Issues
  void addSanitaryIssue() async {
    if (certificate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a certificate file.')));
      return;
    }

    ApiResponse response = await addSanitary(user!.id!.toString(), _report.text,
        getStringImage(certificate), extension);
    print(_report.text);
    print(user!.id!);
    print(certificate);

    if (response.error == null && mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.data}')));

      Navigator.pop(context);
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

  String extension = "";
  String name = '';
  File? certificate;

  void openFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        certificate = File(file.path!);
        name = file.name;
        extension = file.extension!;
      });
    }
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController _report = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 144, 191, 216),
        title: Padding(
          padding: EdgeInsets.only(left: screenSize.width * 0.14),
          child: Text(
            'Sanitary Issues',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: screenSize.width * 0.05,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 144, 191, 216),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.06,
                    bottom: screenSize.height * 0.05,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: screenSize.height * 0.3,
                        width: screenSize.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(195, 255, 255, 255),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 158, 158, 158)
                                  .withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: screenSize.height * 0.01,
                              horizontal: screenSize.width * 0.06,
                            ),
                            child: TextFormField(
                              controller: _report,
                              onTap: () {
                                setState(() {});
                              },
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: "Write Your Report Here !",
                                hintStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 124, 124, 124),
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width * 0.045,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.03),
                      Padding(
                        padding: EdgeInsets.only(
                          right: screenSize.width * 0.24,
                        ),
                        child: Text(
                          "Upload Your medical certificte",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 66, 66, 66),
                            fontSize: screenSize.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Gap(screenSize.height * 0.03),
                      Container(
                        height: screenSize.height * 0.08,
                        width: screenSize.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(195, 255, 255, 255),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 158, 158, 158)
                                  .withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: screenSize.height * 0.01,
                              horizontal: screenSize.width * 0.06,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      name.isNotEmpty
                                          ? name
                                          : "No file selected !",
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 124, 124, 124),
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenSize.width * 0.045,
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35))),
                                  onPressed: () {
                                    openFiles();
                                  },
                                  child: Text(
                                    "Upload",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenSize.width * 0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Gap(screenSize.height * 0.05),
                      SizedBox(
                        height: screenSize.height * 0.08,
                        width: screenSize.width * 0.5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6096B4),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35))),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              addSanitaryIssue();
                            }
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenSize.width * 0.045,
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
      ),
    );
  }
}
