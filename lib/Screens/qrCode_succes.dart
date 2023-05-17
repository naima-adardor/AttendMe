import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../models/Presence.dart';
import '../models/User.dart';
import '../models/api-response.dart';
import '../services/presence_services.dart';
import '../services/user-services.dart';
import 'Login_page.dart';

import 'dart:io';

class GeneratedCodePageSuccess extends StatefulWidget {
  const GeneratedCodePageSuccess({super.key});

  @override
  State<GeneratedCodePageSuccess> createState() => _GeneratedCodePageSuccess();
}

class _GeneratedCodePageSuccess extends State<GeneratedCodePageSuccess> {
  String fullName = "";
  User? user;
  int? ID;
  Presence? presence;

  Future<void> getSessionVariables(SharedPreferences prefs) async {
    setState(() {
      ID = prefs.getInt('IDP');
    });
  }

// Get presence by ID
  void getPByID() async {
    final prefs = await SharedPreferences.getInstance();
    await getSessionVariables(prefs);
    SharedPreferences.getInstance().then((prefs) {
      int? id = prefs.getInt('IDP');
      print(id);
      setState(() {
        ID = id;
      });
    });
    print('ID value: $ID');
    print("enter");
    ApiResponse response;
    try {
      print("first try");
      response = await getPresenceById(ID.toString());
      print("response: $response");
      print("pass the try");
    } catch (e) {
      print("catch the try");
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error retrieving presence data')),
      );
      return;
    }
    print(response.data);
    if (response.error == null) {
      if (response.data != null) {
        setState(() {
          presence = response.data as Presence; // Get the response data
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid presence data')),
        );
      }
    } else if (response.error == unauthorized) {
      logout().then((value) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false,
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${response.error}')),
      );
    }
  }

  @override
  void initState() {
    print("user");
    getUser();
    super.initState();
    print("myFunction");
    getPByID();
  }

  //User Information
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null && mounted) {
      setState(() {
        user = response.data as User;
        fullName = "${user!.first_name}" + " " + "${user!.last_name}";
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

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.06,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    top: screenSize.height * 0.02,
                    bottom: screenSize.height * 0.02,
                    left: screenSize.width * 0.05,
                    right: screenSize.width * 0.05,
                  ),
                  height: screenSize.height * 0.08,
                  width: screenSize.width * 0.86,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 229, 229),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(66, 102, 102, 102),
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    children: [
                      Gap(screenSize.width * 0.04),
                      ClipOval(
                        child: Container(
                          width: screenSize.width * 0.145,
                          height: screenSize.height * 0.07,
                          decoration: BoxDecoration(
                            image: user?.avatar != null
                                ? DecorationImage(
                                    image: NetworkImage('${user!.avatar}'),
                                    fit: BoxFit.cover,
                                  )
                                : const DecorationImage(
                                    image: AssetImage('assets/user.png'),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      Gap(screenSize.height * 0.04),
                      Text(
                        fullName,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 24, 94, 133),
                            fontSize: screenSize.width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(screenSize.height * 0.04),
              Center(
                child: Text(
                  "Download your QR code to share your attendance for latest session",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: screenSize.width * 0.05,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(screenSize.height * 0.05),
              Container(
                width: screenSize.height * 0.29,
                height: screenSize.height * 0.29,
                decoration: BoxDecoration(
                  image: presence != null && presence!.qrcode != null
                      ? DecorationImage(
                          image: NetworkImage(presence!.qrcode!),
                          fit: BoxFit.cover,
                        )
                      : const DecorationImage(
                          image: AssetImage('assets/DefaultQR.png'),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.035,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenSize.height * 0.175,
                    height: screenSize.height * 0.15,
                    child: IconButton(
                      onPressed: () async {
                        try {
                          // Fetch the image data from the network URL
                          final response =
                              await http.get(Uri.parse(presence!.qrcode!));
                          if (response.statusCode == 200) {
                            final bytes = response.bodyBytes;

                            // Get the directory for saving images
                            final directory =
                                await getApplicationDocumentsDirectory();
                            final imagePath =
                                '${directory.path}/QrCodesPresence/1684350047.png';

                            // Create the directory if it doesn't exist
                            await Directory('${directory.path}/QrCodesPresence')
                                .create(recursive: true);

                            // Save the image to the device's gallery
                            final File imageFile = File(imagePath);
                            await imageFile.writeAsBytes(bytes);

                            final result =
                                await ImageGallerySaver.saveFile(imagePath);

                            if (result != null) {
                              print('Image saved to gallery.');
                              Fluttertoast.showToast(
                                msg: 'Image saved!',
                                gravity: ToastGravity.BOTTOM,
                                toastLength: Toast.LENGTH_SHORT,
                              );
                            } else {
                              print('Error saving image to gallery.');
                            }
                          } else {
                            print(
                                'Failed to download image. StatusCode: ${response.statusCode}');
                          }
                        } catch (e) {
                          print('Error: $e');
                        }
                      },
                      icon: Icon(
                        Icons.download_for_offline,
                        color: const Color.fromARGB(255, 25, 129, 21),
                        size: screenSize.height * 0.16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
