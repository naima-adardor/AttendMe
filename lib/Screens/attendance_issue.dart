import 'package:attend_me/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController1 = TextEditingController();
  TextEditingController _timeController2 = TextEditingController();

  late String _selectedTime1;
  late String _selectedTime2;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
    _timeController1 = TextEditingController(
        text: DateFormat('HH:mm ').format(DateTime.now()));
    _timeController2 = TextEditingController(
        text: DateFormat('HH:mm ').format(DateTime.now()));
  }

  Future<void> _selectTime1(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime1 = pickedTime.format(context);
        _timeController1.text = _selectedTime1;
      });
    }
  }

  Future<void> _selectTime2(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime2 = pickedTime.format(context);
        _timeController2.text = _selectedTime2;
      });
    }
  }

  late String _selectedDate;

  final formKey = GlobalKey<FormState>();
  String? _selectedItem = 'Forgot to punch';
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(),
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

  List<String> _items = [
    'Forgot to punch',
    'Network issue',
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 144, 191, 216),
        title: Padding(
          padding: EdgeInsets.only(left: screenSize.width * 0.14),
          child: Text(
            'Attendance Issues',
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.06,
                            vertical: screenSize.height * 0.01,
                          ),
                          child: DropdownButton<String>(
                            value: _selectedItem,
                            items: _items.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      value,
                                      style: TextStyle(
                                        fontSize: screenSize.width * 0.05,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedItem = value;
                              });
                            },
                            dropdownColor:
                                const Color.fromARGB(255, 236, 250, 255),
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            underline: const SizedBox(),
                            iconSize: screenSize.width * 0.1,
                            isExpanded: true,
                          ),
                        ),
                      ),
                      Gap(screenSize.height * 0.026),
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenSize.width * 0.1,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Select date :",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 116, 116, 116),
                                fontSize: screenSize.width * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(screenSize.height * 0.01),
                      Container(
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.06,
                            vertical: screenSize.height * 0.01,
                          ),
                          child: TextFormField(
                            controller: _dateController,
                            readOnly: true,
                            onTap: () => _selectDate(context),
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: screenSize.width * 0.06),
                                  child: const Icon(
                                    Icons.calendar_month,
                                    color: Color.fromARGB(255, 24, 94, 133),
                                  ),
                                ),
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: screenSize.width * 0.05,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Gap(screenSize.height * 0.026),
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenSize.width * 0.1,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Time range :",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 116, 116, 116),
                                fontSize: screenSize.width * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(screenSize.height * 0.01),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.06,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: screenSize.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(195, 255, 255, 255),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color.fromARGB(255, 158, 158, 158)
                                            .withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenSize.width * 0.06,
                                  vertical: screenSize.height * 0.01,
                                ),
                                child: TextFormField(
                                  controller: _timeController1,
                                  readOnly: true,
                                  onTap: () => _selectTime1(context),
                                  decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: screenSize.width * 0.06),
                                        child: const Icon(
                                          Icons.timer_outlined,
                                          color:
                                              Color.fromARGB(255, 24, 94, 133),
                                        ),
                                      ),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.05,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width * 0.09,
                                ),
                              ),
                            ),
                            Container(
                              width: screenSize.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(195, 255, 255, 255),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color.fromARGB(255, 158, 158, 158)
                                            .withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenSize.width * 0.06,
                                  vertical: screenSize.height * 0.01,
                                ),
                                child: TextFormField(
                                  controller: _timeController2,
                                  readOnly: true,
                                  onTap: () => _selectTime2(context),
                                  decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: screenSize.width * 0.06),
                                        child: const Icon(
                                          Icons.timer_outlined,
                                          color:
                                              Color.fromARGB(255, 24, 94, 133),
                                        ),
                                      ),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.05,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(screenSize.height * 0.026),
                      Container(
                        height: screenSize.height * 0.24,
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
                      Gap(screenSize.height * 0.03),
                      SizedBox(
                        height: screenSize.height * 0.08,
                        width: screenSize.width * 0.5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6096B4),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35))),
                          onPressed: () {},
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
