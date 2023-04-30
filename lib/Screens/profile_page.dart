import 'package:attend_me/Screens/change_password2.dart';
import 'package:attend_me/Screens/edit_profile.dart';
import 'package:attend_me/Screens/login_page.dart';
import 'package:attend_me/Screens/view_profile.dart';
import 'package:attend_me/services/user-services.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/constants.dart';
import '../models/User.dart';
import '../models/api-response.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<IconData> icons = [
    Icons.info,
    Icons.edit_square,
    Icons.lock,
    Icons.logout,
  ];

  final List<Color> iconColors = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.red,
  ];

  final List<String> items = [
    'View Informations',
    'Edit Profile',
    'Change Password',
    'Logout',
  ];
  String fullName = "";
  User? user;

//User Information
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      setState(() {
        user = response.data as User;
        fullName = "${user!.first_name}" + " " + "${user!.last_name}";
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

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    padding: EdgeInsets.all(screenSize.height * 0.1),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 144, 191, 216),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        width: screenSize.height * 0.1,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.05),
                      child: Column(
                        children: [
                          Gap(screenSize.height * 0.08),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          image: user?.avatar != null
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                      '${user!.avatar}'),
                                                  fit: BoxFit.cover,
                                                )
                                              : null),
                                    ),
                                  );
                                },
                              );
                            },
                            child: ClipOval(
                              child: Container(
                                width: screenSize.width * 0.45,
                                height: screenSize.height * 0.22,
                                decoration: BoxDecoration(
                                    image: user?.avatar != null
                                        ? DecorationImage(
                                            image:
                                                NetworkImage('${user!.avatar}'),
                                            fit: BoxFit.cover,
                                          )
                                        : null),
                              ),
                            ),
                          ),
                          Gap(screenSize.height * 0.03),
                          Text(
                            fullName,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 24, 94, 133),
                              fontWeight: FontWeight.bold,
                              fontSize: screenSize.width * 0.05,
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
          Container(
            height: screenSize.height * 0.5,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.15,
              ),
              child: ListView.separated(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ViewProfilePage(),
                            ),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfilePage(),
                            ),
                          );
                          break;
                        case 2:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const changePassword2Page(),
                            ),
                          );
                          break;
                        case 3:
                          logout().then((value) => Navigator.of(context)
                              .pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                  (route) => false));
                          break;
                      }
                    },
                    child: ListTile(
                      leading: Icon(
                        icons[index],
                        color: iconColors[index],
                      ),
                      title: Text(
                        items[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenSize.width * 0.045,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: screenSize.height * 0.01,
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.5),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
