import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final formKey = GlobalKey<FormState>();
  String? _selectedItem = 'Forgot to punch';

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
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.05,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedItem = value;
                              });
                            },
                            dropdownColor: Colors.white,
                            underline: SizedBox(),
                          ),
                        ),
                      ),
                      Gap(screenSize.height * 0.05),
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
