import 'package:attend_me/Screens/detail_presence_page.dart';
import 'package:attend_me/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart';
import '../models/Assignment.dart';
import '../models/Presence.dart';
import '../models/User.dart';
import '../models/api-response.dart';
import '../services/assignment_services.dart';
import '../services/presence_services.dart';
import '../services/user-services.dart';
import 'Login_page.dart';

//import '../models/test.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  User? user;

  //User Information
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null && mounted) {
      setState(() {
        user = response.data as User;
        print(user!.id);
      });
      fetchData();
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

  List<Map<String, dynamic>> filteredPresenceList = [];
  List<Map<String, dynamic>> presenceList = [];

//call the function of fetching presences
  Future<void> fetchData() async {
    try {
      List<Map<String, dynamic>> fetchedPresenceList =
          await getPresenceByIdEmp(user!.id!);

      setState(() {
        presenceList = fetchedPresenceList;
        filteredPresenceList = fetchedPresenceList;
      });
    } catch (e) {
      print(e);
    }
  }

  int selectedIndex = 0;
  List category = ['All', 'Late', 'Absent', 'On Time'];

  TextEditingController _dateController1 = TextEditingController();
  late String _selectedDate1;

  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
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
        _selectedDate1 = DateFormat('yyyy-MM-dd').format(picked);
        _dateController1.text = _selectedDate1;
        filterPresenceListByDate(_selectedDate1);
      });
    }
  }

  @override
  void initState() {
    setState(() {
      getUser();
    });

    super.initState();
    // _selectedDate1 = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // _dateController1.text = _selectedDate1;
    _dateController1.text = "yyyy-MM-dd";
  }

  void filterPresenceListByDate(String selectedDate) {
    setState(() {
      filteredPresenceList = presenceList
          .where((presence) => presence['day'] == selectedDate)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(209, 232, 243, 0.878),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Gap(screenSize.height * 0.07),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenSize.width * 0.06,
                      right: screenSize.width * 0.06,
                    ),
                    child: TextFormField(
                      controller: _dateController1,
                      readOnly: true,
                      onTap: () {
                        setState(() {
                          _selectDate1(context);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Date",
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
              ],
            ),
            Gap(screenSize.height * 0.02),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.07,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: screenSize.height * 0.08,
                        width: screenSize.width * 1,
                        child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                right: index == 3
                                    ? screenSize.width * 0
                                    : screenSize.width * 0.03,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    // Filter the presence list based on the selected category
                                    if (selectedIndex == 0) {
                                      // All category
                                      filteredPresenceList = presenceList;
                                    } else {
                                      String selectedStatus =
                                          category[selectedIndex];
                                      filteredPresenceList = presenceList
                                          .where((presence) =>
                                              presence['status'] ==
                                              selectedStatus)
                                          .toList();
                                    }
                                  });
                                },
                                child: Center(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                      left: index == 0 ? 4 : 0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: selectedIndex == index
                                          ? lightBlue
                                          : Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: selectedIndex == index
                                              ? maincolor
                                              : Colors.transparent,
                                          offset: selectedIndex == index
                                              ? Offset(1, 1)
                                              : Offset(0, 0),
                                          blurRadius:
                                              selectedIndex == index ? 2 : 0,
                                        )
                                      ],
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: lightBlue,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  screenSize.width * 0.04),
                                          child: Text(
                                            category[index],
                                            style: TextStyle(
                                              fontSize: screenSize.width * 0.04,
                                              color: selectedIndex == index
                                                  ? Colors.white
                                                  : darkBlue,
                                              fontFamily: 'ro',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(screenSize.height * 0.01),
            Container(
              padding: EdgeInsets.only(
                top: 0,
                left: screenSize.width * 0.03,
                right: screenSize.width * 0.03,
                bottom: screenSize.height * 0.01,
              ),
              height: screenSize.height * 0.658,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                  top: 0,
                ),
                itemExtent: screenSize.height * 0.11,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: filteredPresenceList.length,
                itemBuilder: (BuildContext context, int index) {
                  final presence =
                      filteredPresenceList[index]; // Use filtered list
                  return GestureDetector(
                    onTap: () {
                      // Navigate to another screen
                      if (presence['status'] == "On Time") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapSample(
                              checkIn: presence['check_in'],
                              checkOut: presence['check_out'],
                              status: presence['status'],
                              longitude: presence['longitude'],
                              latitude: presence['latitude'],
                            ),
                          ),
                        );
                      } else if (presence['status'] == "Late") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapSample(
                              checkIn: presence['check_in'],
                              checkOut: presence['check_out'],
                              status: presence['status'],
                              longitude: presence['longitude'],
                              latitude: presence['latitude'],
                              lateTime: presence['lateTime'].toString(),
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: screenSize.height * 0.11,
                      child: Card(
                        elevation: 6.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.886),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.06,
                            vertical: screenSize.height * 0.026,
                          ),
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: screenSize.width * 0.25,
                                  height: screenSize.height * 0.03,
                                  child: Center(
                                    child: Text(
                                      presence['day'],
                                      style: TextStyle(
                                          color: darkBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenSize.width * 0.039),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width * 0.2,
                                ),
                                Container(
                                  width: screenSize.width * 0.25,
                                  height: screenSize.height * 0.1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: presence['status'] == 'Absent'
                                              ? const Color.fromARGB(
                                                  255, 255, 0, 0)
                                              : presence['status'] == 'Late'
                                                  ? const Color.fromARGB(
                                                      255, 255, 137, 3)
                                                  : const Color.fromARGB(
                                                      255, 0, 175, 9),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: presence['status'] == 'Absent'
                                              ? const Color.fromARGB(
                                                  255, 255, 0, 0)
                                              : presence['status'] == 'Late'
                                                  ? const Color.fromARGB(
                                                      255, 255, 137, 3)
                                                  : const Color.fromARGB(
                                                      255, 0, 175, 9),
                                          offset: Offset(0, 0),
                                          blurRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        presence[
                                            'status'], // Use the status if available, otherwise default to 'Absent'
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: 'ro',
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenSize.width * 0.043,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
