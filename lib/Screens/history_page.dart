import 'package:attend_me/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
  @override
  void initState() {
    // TODO: implement initState
   // lessons = getLessons();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
     
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
    
                 onTap: () {
    
                   setState(() {});
    
                 },
    
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
    
                   prefixIcon: const Icon(
    
                     Icons.date_range,
    
                     color: Color(0xFF6096B4),
    
                   ),
    
                 ),
    
               ),
    
             ),
    
           ),
    
           Expanded(
    
             child: Padding(
    
               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    
               child: TextFormField(
    
                 onTap: () {
    
                   setState(() {});
    
                 },
    
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
    
                   prefixIcon: const Icon(
    
                     Icons.date_range,
    
                     color: Color(0xFF6096B4),
    
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
                  //SizedBox(height: 3),
                  
                ],
              ),
            ),
            Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context , index){
            return SizedBox(
                 
                        height: MediaQuery.of(context).size.height*0.1,
child:Card(
             
              elevation: 6.0,
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(241, 241, 243, 0.89),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(width: 1.0, color: Colors.white24),
                      ),
                    ),
                    child: Icon(Icons.autorenew,color:darkBlue,),
                  ),
                  title: Text("22/12/2020",
                  style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold),),
                  subtitle: Row(
                    children: [
                      // Icon(Icons.linear_scale, color: Colors.yellowAccent,),
                      // Text(" Intermediate", style: TextStyle(color: Colors.white),)
                     
                      Expanded(
                        
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Late", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                  
                  onTap: (){
                         },
                ),
              ),
            )
            
            ) ;
          },
        ),
      ),

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
