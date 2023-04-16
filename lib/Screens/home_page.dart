import 'package:attend_me/Screens/grid_dashbord.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       
        
      
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: <Widget>[
                 
                CircleAvatar(
                  
        radius: 27,
        backgroundImage: AssetImage('assets/profile.jpg'),

  
      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      "Adardor Naima",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Welcome !",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: 
                  Icon(Icons.notifications_none,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 35,

                  ),
                  onPressed: (
     ) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => NotificationScreen(),
                    //   ),
                    // );
        

                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          
                    Text(
                      "Monthly Presence Summary",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 116, 110, 110),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                      SizedBox(
            height: 40,
          ),
          
        Wrap(spacing: 20.0,
        runSpacing: 20.0,
        children:[
           SizedBox(
              height: 160,
              width: 160,
             
         
             
               child: Card(
                 
            
                 
              color:Color.fromARGB(255, 78, 146, 163),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                 
                    children: [
                      Gap(12),
                      Image.asset("assets/late.png"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Late",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "12 times",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 207, 196, 196),
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
         
                )
              
         
            )
                 ),
         ),
           SizedBox(
              height: 160,
              width: 160,
             
         
             
               child: Card(
                 
            
                 
              color:Color.fromARGB(255, 199, 34, 136),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                 
                    children: [
                     Gap(12),
                      Image.asset("assets/Absent.png",height: 50,width: 50,),
                     
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Absent",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "2 times",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 207, 196, 196),
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
         
                )
              
         
            )
                 ),
         ),
           SizedBox(
              height: 160,
              width: 160,
             
         
             
               child: Card(
                 
            
                 
              color:Color.fromARGB(255, 158, 80, 182),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                 
                    children: [
                      Gap(12),
                      Image.asset("assets/WorkingHours.png",height: 50,width: 50,),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Working Hours",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "20:45:00",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 207, 196, 196),
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
         
                )
              
         
            )
                 ),
         ),
           SizedBox(
              height: 160,
              width: 160,
             
         
             
               child: Card(
                 
            
                 
              color:Color.fromARGB(255, 231, 89, 23),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                 
                    children: [
                        Gap(12),
                      Image.asset("assets/OnTime.png",height: 50,width: 50,),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "OnTime",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "19 times",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 207, 196, 196),
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
         
                )
              
         
            )
                 ),
         ),
        ]
        )
         
        ],
      ),
    );
  }
}
