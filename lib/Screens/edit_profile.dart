import 'package:attend_me/Screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  DateTime? _selectedDate;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 144, 191, 216),
        title: const Padding(
          padding: EdgeInsets.only(left: 65),
          child: Text(
            'Edit Profile',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      const Gap(10),
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
                            const CircleAvatar(
                              radius: 70,
                              backgroundImage: AssetImage("assets/profile.jpg"),
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
                                  onPressed: () {
                                    // Handle edit button press
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      const Text(
                        "Naima ELJID",
                        style: TextStyle(
                          color: Color.fromARGB(255, 24, 94, 133),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const Gap(27),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: SizedBox(
                                  height: 50,
                                  width: 155,
                                  child: TextFormField(
                                    initialValue: "Naima",
                                    onTap: () {
                                      setState(() {});
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "First Name",
                                      labelStyle: TextStyle(
                                          color:
                                              Color.fromARGB(255, 24, 94, 133)),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 24, 94, 133),
                                          width: 2.0,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 24, 94, 133),
                                          width: 2.0,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.person_pin_rounded,
                                        color: Color.fromARGB(255, 24, 94, 133),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: SizedBox(
                                  height: 50,
                                  width: 155,
                                  child: TextFormField(
                                    initialValue: "ELJID",
                                    onTap: () {
                                      setState(() {});
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "Last Name",
                                      labelStyle: TextStyle(
                                          color:
                                              Color.fromARGB(255, 24, 94, 133)),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 24, 94, 133),
                                          width: 2.0,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 24, 94, 133),
                                          width: 2.0,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.person_pin_rounded,
                                        color: Color.fromARGB(255, 24, 94, 133),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(17),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: SizedBox(
                              height: 50,
                              width: 320,
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
                          const Gap(17),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: SizedBox(
                              height: 50,
                              width: 320,
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
                          const Gap(17),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: SizedBox(
                              height: 50,
                              width: 320,
                              child: TextFormField(
                                initialValue: _selectedDate != null
                                    ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                                    : "27/02/2003",
                                onTap: () {},
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
                                    onTap: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1970),
                                        lastDate: DateTime(2025),
                                      );
                                      if (picked != null) {
                                        setState(() {
                                          _selectedDate = picked;
                                        });
                                      }
                                    },
                                    child: const Icon(
                                      Icons.calendar_month,
                                      color: Color.fromARGB(255, 24, 94, 133),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(17),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: SizedBox(
                              height: 50,
                              width: 320,
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
                          const Gap(30),
                          SizedBox(
                            width: 200,
                            height: 50,
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
                              child: const Text(
                                "Edit profile",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const Gap(20),
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
