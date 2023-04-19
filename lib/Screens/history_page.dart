import 'package:attend_me/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

//import '../models/test.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.03,
                vertical: screenSize.height * 0,
              ),
              height: screenSize.height * 1.1,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) => Container(
                  height: MediaQuery.of(context).size.height * 0.113,
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
                                  "2020-12-22",
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
                                      color:
                                          const Color.fromARGB(255, 255, 0, 0),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 255, 0, 0),
                                      offset: Offset(0, 0),
                                      blurRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Absent',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
