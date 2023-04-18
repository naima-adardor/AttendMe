import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/colors.dart';

class SucessCheckinPage extends StatefulWidget {
  const SucessCheckinPage({super.key});

  @override
  State<SucessCheckinPage> createState() => _SucessCheckinPageState();
}

class _SucessCheckinPageState extends State<SucessCheckinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     
      body: SingleChildScrollView( 
        child: Column(
          
          children:  [
            SizedBox(height: 100),
            Center(
             //add image here
             child: Image.asset('assets/check.png',height: 180,),
            ),
            
              
             //add image here
             
           
            SizedBox(height: 60),
           
            Padding(
              padding: const EdgeInsets.only(left: 70,right: 70),
              child:
             Center(
              child: Text(
                "You have successfully checked-in !",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:Color.fromARGB(255, 32, 199, 135),
                ),
                textAlign: TextAlign.center,
              ),
            ),),
           
           
             Container(
  
              margin: EdgeInsets.only(top:100,right: 30,left: 30),
            child: Row(
  children: [
         
             Image.asset(
      'assets/alert.png',
      width: 40,
      height: 40,
    ),
            SizedBox(width: 30),  
                Flexible(
                
                child: Text(
                  "To complete today's attendance record,please scan your QR code before leaving work .",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color:Color.fromARGB(255, 59, 59, 59),
                   
                  ),
                  textAlign: TextAlign.center,
                  
              ),
               
                
              ),
            
 
  ],
            ),
             ),
             Padding(
               padding: const EdgeInsets.only(top:100.0,right: 30),
               child: Align( 
                alignment: Alignment.centerRight,
                 child: InkWell(
                        
               onTap: () {
                 // Navigate to the desired page here
               },
               child: Image.asset('assets/exit.png',height: 80,),
             ),
               ),
             ),
             const Gap(20),
          ],
        
        ),
      ),
    );
  }
}