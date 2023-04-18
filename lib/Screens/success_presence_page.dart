import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SuccessPresencePage extends StatefulWidget {
  const SuccessPresencePage({super.key});

  @override
  State<SuccessPresencePage> createState() => _SuccessPresencePageState();
}

class _SuccessPresencePageState extends State<SuccessPresencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     
      body: SingleChildScrollView( 
        child: Column(
          
          children:  [
            SizedBox(height: 190),
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
                "Your attendance for today's session has been recorded. Thank you for using AttendMe !",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:Color.fromARGB(255, 32, 199, 135),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ),
            const Gap(20),],
        ),
      ),
    );

           
  }
}