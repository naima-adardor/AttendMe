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
  //late List<Lesson> lessons;
   int indexx = 0;
  List category = ['All', 'Late', 'Absent', 'On Time'];
  List categoryname = ['dinner', 'lunch', 'dinner', 'fast'];
  List food = [
    ['burger', 'omlet', 'grilled wings', 'Grilled ribs'],
    ['pizza', 'steak', 'pasta', 'burger'],
    ['burger', 'omlet', 'grilled wings', 'Grilled ribs'],
    ['pancake', 'egg', 'banana', 'egg'],
  ];
  //String _selectedDate1 =DateFormat('yMd').format(DateTime.now());
  //String _selectedDate2 =DateFormat('yMd').format(DateTime.now());
  TextEditingController _dateController = TextEditingController(text: '2022-01-01',);
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
TextEditingController _dateController1 = TextEditingController(text: '2022-01-01',);
late String _selectedDate1='2022-01-01';

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
    return Scaffold(
            backgroundColor: Color.fromRGBO(209, 232, 243, 0.878),
     
      body: SingleChildScrollView(
      
      child: Column(
        
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[ 
                 Gap(60), 
    Row(
    
         children: [
    
           Expanded(
    
             child: Padding(
    
               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    
               child: TextFormField(
    controller: _dateController1,
    readOnly: true,
    onTap: () => _selectDate1(context),
    decoration: InputDecoration(
      labelText: "From",
      labelStyle: TextStyle(
        color: const Color(0xFF6096B4),
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
    
           Expanded(
    
             child: Padding(
    
               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    
               child: TextFormField(
    controller: _dateController,
    readOnly: true,
    onTap: () => _selectDate(context),
    decoration: InputDecoration(
      labelText: "To",
      labelStyle: TextStyle(
        color: const Color(0xFF6096B4),
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
              
      
    
    
      
  

                  
            
         Gap(10),   
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
           
              child: Column(
                children: [
                  Container(
                    height: 60,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                indexx = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                                left: index == 0 ? 4 : 0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    indexx == index ? lightBlue : Colors.white,
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
                                  
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17),
                                      
                                  child: Text(
                                    
                                    category[index],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          indexx == index ? Colors.white : darkBlue,
                                      fontFamily: 'ro',
                                     
                                    ),
                                    
                                  ),
                                ),
                              ),
                              )
                             
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 0),
                  
                ],
              ),
            ),
            
  Container(
    padding: EdgeInsets.symmetric(horizontal: 3.0),
    height: 700,
    child: ListView.builder(
              scrollDirection: Axis.vertical,
                shrinkWrap: true,//flexible animation when we scroll
                itemCount: 20,
                
                itemBuilder: (BuildContext context ,int index) => Container(
                   height: MediaQuery.of(context).size.height*0.1,
   child:Card(
              
                  elevation: 8.0,
                 
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.886),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                    child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                      // Text("22/12/2020",
                    //  style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold),),
                     
                        children:<Widget> [
                          // Icon(Icons.linear_scale, color: Colors.yellowAccent,),
                          // Text(" Intermediate", style: TextStyle(color: Colors.white),)
                         Container(
                           width: 100,
                           height:100 ,
                         
                           child: Text("22/12/2020",
                           style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold,fontSize: 17),),
                          ),
                        
                         /* Expanded(
                            
                            child: Padding(
                              padding:  EdgeInsets.only(right: 50.0),
   
   
                              child: Text("Late",
                               style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                               textAlign: TextAlign.right,
                               
                               
                               ),
                            ),
                          ),*/
                          SizedBox(width: 10,),
                          Container(
                            width: 100,
                            height: 100,
                          
                        /* child:   badges.Badge(
                          showBadge: true,
        ignorePointer: false,
        badgeAnimation: badges.BadgeAnimation.rotation(
          animationDuration: Duration(seconds: 1),
          colorChangeAnimationDuration: Duration(seconds: 1),
          loopAnimation: false,
          curve: Curves.fastOutSlowIn,
          colorChangeAnimationCurve: Curves.easeInCubic,
        ),
        badgeStyle: badges.BadgeStyle(
          shape: badges.BadgeShape.square,
          badgeColor: Colors.blue,
          padding: EdgeInsets.all(5),
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderGradient: badges.BadgeGradient.linear(
              colors: [Colors.red, Colors.black]),
          badgeGradient: badges.BadgeGradient.linear(
              colors: [Colors.blue, Colors.yellow],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
          ),
          elevation: 0,
        ),*/
        
      child: Container(
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromARGB(255, 255, 0, 0), width: 2),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 255, 0, 0),
          offset: Offset(0, 0),
          blurRadius: 0,
        ),
      ],
    ),
    padding: EdgeInsets.only(left: 24),
    child: Text(
      'Absent',
      
      style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 255, 255, 255),fontFamily: 'ro',fontWeight: FontWeight.bold),
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
            const Gap(30)
              ],
      ),
      ),   
         
            
            
               


          
       
      

              
      
      
      );

    

  }
  /*
  List <Lesson> getLessons(){
  return[
    Lesson(
      title: "Introduction to Driving",
      level: "Beginner",
      indicatorValue: 0.33,
      price: 20,
      content: "Start by taking a couple of minutes to read the info , Start by taking a couple of minutes to read the info , Start by taking a couple of minutes to read the info , Start by taking a couple of minutes to read the info"
    ),
    Lesson(
        title: "Introduction to Driving 2",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 2,
        content: "Start by taking a couple of minutes to read the info"
    ),
    Lesson(
        title: "Introduction to Driving 3",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 50,
        content: "Start by taking a couple of minutes to read the info"
    ),
    Lesson(
        title: "Introduction to Driving 4",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 20,
        content: "Start by taking a couple of minutes to read the info"
    ),
    Lesson(
        title: "Introduction to Driving 5",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 20,
        content: "Start by taking a couple of minutes to read the info"
    ),
    Lesson(
        title: "Introduction to Driving 6",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 20,
        content: "Start by taking a couple of minutes to read the info"
    ),
    Lesson(
        title: "Introduction to Driving 7",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 20,
        content: "Start by taking a couple of minutes to read the info"
    ),
     Lesson(
        title: "Introduction to Driving 7",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 20,
        content: "Start by taking a couple of minutes to read the info"
    ),
     Lesson(
        title: "Introduction to Driving 7",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 20,
        content: "Start by taking a couple of minutes to read the info"
    ),
     Lesson(
        title: "Introduction to Driving 7",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 20,
        content: "Start by taking a couple of minutes to read the info"
    ),
     Lesson(
        title: "Introduction to Driving 7",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 20,
        content: "Start by taking a couple of minutes to read the info"
    ),
     Lesson(
        title: "Introduction to Driving 7",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 20,
        content: "Start by taking a couple of minutes to read the info"
    ),
  ];
}
*/
}
