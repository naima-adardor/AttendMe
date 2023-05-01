import 'dart:convert';
import 'dart:io';

import 'package:attend_me/Screens/bottom_bar.dart';
import 'package:attend_me/Screens/login_page.dart';
import 'package:attend_me/Screens/profile_page.dart';
import 'package:attend_me/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import 'package:attend_me/constants/colors.dart';

import '../constants/constants.dart';
import '../models/api-response.dart';
import '../services/user-services.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _image;

  User? user;
  bool loading = true;
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _adress = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String fullName = "";

  //User Information
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      setState(() {
        user = response.data as User;
        loading = false;
        _firstName.text = user!.first_name ?? '';
        _lastName.text = user!.last_name ?? '';
        _email.text = user!.email ?? '';
        _phoneNumber.text = user!.phone_number ?? '';
        _dateController.text = user!.birthday ?? '';
        _adress.text = user!.adress ?? '';
        fullName = _firstName.text + " " + _lastName.text;
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  Future<String> getBase64Image(String? imageUrl) async {
    if (imageUrl == null) {
      return ''; // or return null, depending on your use case
    }

    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode != 200) {
      return '';
    }

    final bytes = response.bodyBytes;
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/image.png');
    await file.writeAsBytes(bytes);

    final imageBytes = await file.readAsBytes();
    final base64Image = base64Encode(imageBytes);

    return base64Image;
  }

  //Update Profile
  void updateProfile() async {
    ApiResponse response = await updateUser(
        _firstName.text,
        _lastName.text,
        _email.text,
        _phoneNumber.text,
        DateFormat('yyyy-MM-dd').format(DateTime.parse(_dateController.text)),
        _adress.text,
        (getStringImage(_image) ?? await getBase64Image(user!.avatar))
            as String);

    if (mounted) {
      setState(() {
        loading = false;
      });
    }
    if (response.error == null && mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.data}')));
      getUser();
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

  final _picker = ImagePicker();

//pickImage
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  late String _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: darkBlue,
              secondary: lightBlue,
              onSecondary: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: darkBlue,
              ),
            ),
            textTheme: const TextTheme(
              headline4: TextStyle(
                fontFamily: "NexaBold",
              ),
              overline: TextStyle(
                fontFamily: "NexaBold",
              ),
              button: TextStyle(
                fontFamily: "NexaBold",
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = DateFormat('yyyy-MM-dd').format(picked);
        _dateController.text = _selectedDate;
      });
    }
  }

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // setState(() {
    getUser();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 144, 191, 216),
        title: Padding(
          padding: EdgeInsets.only(
            left: screenSize.width * 0.2,
            right: screenSize.width * 0.2,
          ),
          child: Text(
            'Edit Profile',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenSize.width * 0.05,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 144, 191, 216),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.021,
                  vertical: screenSize.height * 0.021,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Column(
                          children: [
                            Gap(screenSize.height * 0),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color.fromARGB(255, 24, 94, 133),
                                  width: 5,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                image: _image == null
                                                    ? user?.avatar != null
                                                        ? DecorationImage(
                                                            image: NetworkImage(
                                                                '${user!.avatar}'),
                                                            fit: BoxFit.cover,
                                                          )
                                                        : const DecorationImage(
                                                            image: AssetImage(
                                                                'assets/user.png'),
                                                            fit: BoxFit.cover,
                                                          )
                                                    : DecorationImage(
                                                        image: FileImage(
                                                            _image ?? File('')),
                                                        fit: BoxFit.cover),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: ClipOval(
                                      child: Container(
                                        width: screenSize.width * 0.3,
                                        height: screenSize.height * 0.15,
                                        decoration: BoxDecoration(
                                          image: _image == null
                                              ? user?.avatar != null
                                                  ? DecorationImage(
                                                      image: NetworkImage(
                                                          '${user!.avatar}'),
                                                      fit: BoxFit.cover,
                                                    )
                                                  : const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/user.png'),
                                                      fit: BoxFit.cover,
                                                    )
                                              : DecorationImage(
                                                  image: FileImage(
                                                      _image ?? File('')),
                                                  fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: const Color.fromARGB(
                                          255, 24, 94, 133),
                                      child: IconButton(
                                        icon: const Icon(Icons.edit),
                                        color: Colors.white,
                                        onPressed: () {
                                          _pickImage();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(screenSize.height * 0.015),
                            Text(
                              fullName,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 24, 94, 133),
                                fontWeight: FontWeight.bold,
                                fontSize: screenSize.width * 0.05,
                              ),
                            ),
                            Gap(screenSize.height * 0.03),
                            Column(
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: screenSize.height * 0.08,
                                    width: screenSize.width * 0.9,
                                    child: Center(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: screenSize.height * 0.08,
                                            width: screenSize.width * 0.43,
                                            child: TextFormField(
                                              controller: _firstName,
                                              onTap: () {
                                                setState(() {});
                                              },
                                              decoration: const InputDecoration(
                                                labelText: "First Name",
                                                labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 24, 94, 133),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 24, 94, 133),
                                                    width: 2.0,
                                                    style: BorderStyle.solid,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 24, 94, 133),
                                                    width: 2.0,
                                                    style: BorderStyle.solid,
                                                  ),
                                                ),
                                                prefixIcon: Icon(
                                                  Icons.person_pin_rounded,
                                                  color: Color.fromARGB(
                                                      255, 24, 94, 133),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width: screenSize.width * 0.04),
                                          SizedBox(
                                            height: screenSize.height * 0.08,
                                            width: screenSize.width * 0.43,
                                            child: TextFormField(
                                              controller: _lastName,
                                              onTap: () {
                                                setState(() {});
                                              },
                                              decoration: const InputDecoration(
                                                labelText: "Last Name",
                                                labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 24, 94, 133),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 24, 94, 133),
                                                    width: 2.0,
                                                    style: BorderStyle.solid,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 24, 94, 133),
                                                    width: 2.0,
                                                    style: BorderStyle.solid,
                                                  ),
                                                ),
                                                prefixIcon: Icon(
                                                  Icons.person_pin_rounded,
                                                  color: Color.fromARGB(
                                                      255, 24, 94, 133),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(screenSize.height * 0.021),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  child: SizedBox(
                                    height: screenSize.height * 0.08,
                                    width: screenSize.width * 0.9,
                                    child: TextFormField(
                                      controller: _email,
                                      onTap: () {
                                        setState(() {});
                                      },
                                      decoration: const InputDecoration(
                                        labelText: "Email",
                                        labelStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 24, 94, 133)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 24, 94, 133),
                                            width: 2.0,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 24, 94, 133),
                                            width: 2.0,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color:
                                              Color.fromARGB(255, 24, 94, 133),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(screenSize.height * 0.021),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  child: SizedBox(
                                    height: screenSize.height * 0.08,
                                    width: screenSize.width * 0.9,
                                    child: TextFormField(
                                      controller: _phoneNumber,
                                      onTap: () {
                                        setState(() {});
                                      },
                                      decoration: const InputDecoration(
                                        labelText: "Phone number",
                                        labelStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 24, 94, 133)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 24, 94, 133),
                                            width: 2.0,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 24, 94, 133),
                                            width: 2.0,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color:
                                              Color.fromARGB(255, 24, 94, 133),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(screenSize.height * 0.021),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  child: SizedBox(
                                    height: screenSize.height * 0.08,
                                    width: screenSize.width * 0.9,
                                    child: TextFormField(
                                      controller: _dateController,
                                      readOnly: true,
                                      onTap: () => _selectDate(context),
                                      decoration: InputDecoration(
                                        labelText: "Birthday",
                                        labelStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 24, 94, 133),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 24, 94, 133),
                                            width: 2.0,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 24, 94, 133),
                                            width: 2.0,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.calendar_month_outlined,
                                          color:
                                              Color.fromARGB(255, 24, 94, 133),
                                        ),
                                        suffixIcon: GestureDetector(
                                          child: const Icon(
                                            Icons.calendar_month,
                                            color: Color.fromARGB(
                                                255, 24, 94, 133),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(screenSize.height * 0.021),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  child: SizedBox(
                                    height: screenSize.height * 0.08,
                                    width: screenSize.width * 0.9,
                                    child: TextFormField(
                                      controller: _adress,
                                      onTap: () {
                                        setState(() {});
                                      },
                                      decoration: const InputDecoration(
                                        labelText: "Adress",
                                        labelStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 24, 94, 133)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 24, 94, 133),
                                            width: 2.0,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 24, 94, 133),
                                            width: 2.0,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.location_on,
                                          color:
                                              Color.fromARGB(255, 24, 94, 133),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(screenSize.height * 0.021),
                                SizedBox(
                                  width: screenSize.width * 0.5,
                                  height: screenSize.height * 0.07,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 24, 94, 133),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(35))),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        setState(() {
                                          loading = true;
                                        });
                                        updateProfile();
                                        // Navigator.pop(context);
                                      }
                                    },
                                    child: Text(
                                      "Edit profile",
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
                          ],
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
