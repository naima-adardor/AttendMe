import 'package:attend_me/Screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:attend_me/constants/colors.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _dateController = TextEditingController(
    text: '2003-02-27',
  );
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
        _selectedDate = DateFormat('yMd').format(picked);
        _dateController.text = _selectedDate;
      });
    }
  }

  final formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
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
                            CircleAvatar(
                              radius: screenSize.width * 0.16,
                              backgroundImage:
                                  const AssetImage("assets/profile.jpg"),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    const Color.fromARGB(255, 24, 94, 133),
                                child: IconButton(
                                  icon: const Icon(Icons.edit),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(screenSize.height * 0.015),
                      Text(
                        "Naima ELJID",
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
                                        initialValue: "Naima",
                                        onTap: () {
                                          setState(() {});
                                        },
                                        decoration: const InputDecoration(
                                          labelText: "First Name",
                                          labelStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 24, 94, 133),
                                          ),
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
                                            Icons.person_pin_rounded,
                                            color: Color.fromARGB(
                                                255, 24, 94, 133),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: screenSize.width * 0.04),
                                    SizedBox(
                                      height: screenSize.height * 0.08,
                                      width: screenSize.width * 0.43,
                                      child: TextFormField(
                                        initialValue: "ELJID",
                                        onTap: () {
                                          setState(() {});
                                        },
                                        decoration: const InputDecoration(
                                          labelText: "Last Name",
                                          labelStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 24, 94, 133),
                                          ),
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
                                initialValue: "naima.eljid03@gmail.com",
                                onTap: () {
                                  setState(() {});
                                },
                                decoration: const InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 24, 94, 133)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 24, 94, 133),
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 24, 94, 133),
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color.fromARGB(255, 24, 94, 133),
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
                                initialValue: "0625678909",
                                onTap: () {
                                  setState(() {});
                                },
                                decoration: const InputDecoration(
                                  labelText: "Phone number",
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 24, 94, 133)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 24, 94, 133),
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 24, 94, 133),
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Color.fromARGB(255, 24, 94, 133),
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
                                    color: Color.fromARGB(255, 24, 94, 133),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 24, 94, 133),
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 24, 94, 133),
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.calendar_month_outlined,
                                    color: Color.fromARGB(255, 24, 94, 133),
                                  ),
                                  suffixIcon: GestureDetector(
                                    child: const Icon(
                                      Icons.calendar_month,
                                      color: Color.fromARGB(255, 24, 94, 133),
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
                                initialValue: "Tilila, Agadir, Moroco",
                                onTap: () {
                                  setState(() {});
                                },
                                decoration: const InputDecoration(
                                  labelText: "Adress",
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 24, 94, 133)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 24, 94, 133),
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 24, 94, 133),
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.location_on,
                                    color: Color.fromARGB(255, 24, 94, 133),
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
                                  backgroundColor:
                                      const Color.fromARGB(255, 24, 94, 133),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35))),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const ProfilePage(),
                                  ),
                                );
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
