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
  late List<Assignment> assignment;
  late List<Presence> presence = [];

  //User Information
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null && mounted) {
      setState(() {
        user = response.data as User;
        print(user!.id);
      });

      getAssignment();
      getPre();
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

  int count = 0;

  // Assignment Information
  Future<void> getAssignment() async {
    ApiResponse response = await getAssignments(user!.id!);

    if (response.error == null && mounted) {
      DateTime today = DateTime.now();
      List<Assignment> allAssignments = response.data as List<Assignment>;
      List<Assignment> filteredAssignments = [];

      for (Assignment assignment in allAssignments) {
        if (assignment.start_date!.isBefore(today) &&
            assignment.end_date!.isBefore(today)) {
          filteredAssignments.add(assignment);
        } else if (assignment.start_date!.isBefore(today) &&
            assignment.end_date!.isAfter(today)) {
          int daysCount = today.difference(assignment.start_date!).inDays + 1;
          Assignment updatedAssignment = Assignment(
            id_assignment_elevator: assignment.id_assignment_elevator,
            id_elevator: assignment.id_elevator,
            id_employee: assignment.id_employee,
            time_in: assignment.time_in,
            time_out: assignment.time_out,
            start_date: assignment.start_date,
            end_date: today.subtract(Duration(days: 1)),
          );
          filteredAssignments.add(updatedAssignment);
          count += daysCount;
        }
      }

      filteredAssignments.sort((a, b) => a.end_date!.compareTo(b.end_date!));

      setState(() {
        assignment = filteredAssignments;
        count = 0;

        for (Assignment assignments in assignment) {
          int daysCount =
              assignments.end_date!.difference(assignments.start_date!).inDays +
                  1;
          count += daysCount;
        }
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            if (mounted)
              {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                )
              }
          });
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${response.error}')),
        );
      }
    }
  }

  //Presence Information
  void getPre() async {
    ApiResponse response = await getPresences(user!.id!);
    if (response.error == null && mounted) {
      setState(() {
        presence = response.data as List<Presence>;
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

  //check
  String checkAttendance(DateTime date) {
    String attendanceStatus = '';
    for (Assignment assign in assignment) {
      if (date.isAfter(assign.end_date!) || date.isBefore(assign.start_date!)) {
        continue;
      }
      bool isPresent = false;
      for (Presence pres in presence) {
        if (pres.attendance_day!.isAtSameMomentAs(date)) {
          isPresent = true;

          DateTime assignTime = DateTime.parse("2000-12-10 " + assign.time_in!);
          DateTime presTime = DateTime.parse("2000-12-10 " + pres.check_in!);
          if (assignTime.isBefore(presTime)) {
            attendanceStatus += 'Late';
          } else {
            attendanceStatus += 'On time';
          }
          break;
        }
      }
      if (!isPresent) {
        attendanceStatus += 'Absent';
      }
    }
    return attendanceStatus;
  }

  int indexx = 0;
  List category = ['All', 'Late', 'Absent', 'On Time'];

  TextEditingController _dateController = TextEditingController(
    text: '2022-01-01',
  );
  late String _selectedDate2;

  Future<void> _selectDate(BuildContext context) async {
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
        _selectedDate2 = DateFormat('yMd').format(picked);
        _dateController.text = _selectedDate2;
      });
    }
  }

  TextEditingController _dateController1 = TextEditingController(
    text: '2022-01-01',
  );
  late String _selectedDate1 = '2022-01-01';

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
        _selectedDate1 = DateFormat('yMd').format(picked);
        _dateController1.text = _selectedDate1;
      });
    }
  }

  @override
  void initState() {
    setState(() {
      getUser();
    });

    super.initState();
    if (_selectedDate1 == null) {
      _selectedDate1 = DateFormat('yMd').format(DateTime.now());
      _dateController1.text = _selectedDate1;
    }
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
                    ),
                    child: TextFormField(
                      controller: _dateController1,
                      readOnly: true,
                      onTap: () => _selectDate1(context),
                      decoration: InputDecoration(
                        labelText: "From",
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
                Gap(screenSize.width * 0.03),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: screenSize.width * 0.06,
                    ),
                    child: TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      decoration: InputDecoration(
                        labelText: "To",
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
                                    indexx = index;
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
                                      color: indexx == index
                                          ? lightBlue
                                          : Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: indexx == index
                                              ? maincolor
                                              : Colors.transparent,
                                          offset: indexx == index
                                              ? Offset(1, 1)
                                              : Offset(0, 0),
                                          blurRadius: indexx == index ? 2 : 0,
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
                                              color: indexx == index
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
                itemCount: count,
                itemBuilder: (BuildContext context, int index) {
                  // Find the Assignment object that corresponds to this row
                  int currentCount = 0;
                  late Assignment currentAssignment;
                  for (int i = 0; i < assignment.length; i++) {
                    int daysCount = assignment[i]
                            .end_date!
                            .difference(assignment[i].start_date!)
                            .inDays +
                        1;
                    if (index < currentCount + daysCount) {
                      currentAssignment = assignment[i];
                      break;
                    } else {
                      currentCount += daysCount;
                    }
                  }

                  // Calculate the date for this row
                  DateTime date = currentAssignment.start_date!
                      .add(Duration(days: index - currentCount));
                  // Find the status of the employee for the current date
                  String? status = checkAttendance(date);

                  return GestureDetector(
                    onTap: () {
                      // Navigate to another screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapSample()),
                      );
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
                                      DateFormat('yyyy-MM-dd').format(date),
                                      style: TextStyle(
                                          color: darkBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenSize.width * 0.044),
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
                                          color: status == 'Absent'
                                              ? const Color.fromARGB(
                                                  255, 255, 0, 0)
                                              : status == 'Late'
                                                  ? const Color.fromARGB(
                                                      255, 255, 137, 3)
                                                  : const Color.fromARGB(
                                                      255, 0, 175, 9),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: status == 'Absent'
                                              ? const Color.fromARGB(
                                                  255, 255, 0, 0)
                                              : status == 'Late'
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
                                        status, // Use the status if available, otherwise default to 'Absent'
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
