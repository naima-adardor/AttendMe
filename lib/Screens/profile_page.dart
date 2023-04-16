import 'package:attend_me/Screens/change_password2.dart';
import 'package:attend_me/Screens/edit_profile.dart';
import 'package:attend_me/Screens/view_profile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
  ];

  final List<Color> iconColors = [
    Colors.blue,
    Colors.orange,
    Colors.green,
  ];

  final List<String> items = [
    'View Informations',
    'Edit Profile',
    'Change Password',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 144, 191, 216),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        width: 120,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 110),
                      child: Column(
                        children: const [
                          Gap(70),
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage("assets/profile.jpg"),
                          ),
                          Gap(25),
                          Text(
                            "Naima ELJID",
                            style: TextStyle(
                              color: Color.fromARGB(255, 24, 94, 133),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
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
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 57,
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
                              builder: (context) => const changePassword2(),
                            ),
                          );
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
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 1,
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
