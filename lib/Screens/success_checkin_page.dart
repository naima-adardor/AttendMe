import 'package:attend_me/Screens/bottom_bar.dart';
import 'package:attend_me/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../constants/colors.dart';

class SucessCheckinPage extends StatelessWidget {
  final String code;
  final Function() closeScreen;
  const SucessCheckinPage({super.key,required this.code,required this.closeScreen});
  //final String scanResult;


 
  

  // bool buildWidgets = false;
   
 
  //get scanResult => BottomBar().result.toString();
  /*Future<void> checkKey() async {
    

    String key = "fr.wikipedia.org";

    if(widget.scanResult.toUpperCase() == key) {
      debugPrint("True");
      Future.microtask(() {
        setState(() {
          buildWidgets = true;
        });
      });
      
    } else {
      debugPrint("False");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }*/
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
      appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Padding(
            padding: EdgeInsets.only(left: 45),
          
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 133, 118, 118)),
            onPressed: () {
              closeScreen();
              Navigator.pop(context);
            },
          ),
          elevation: 1,
        ),
      body: SingleChildScrollView( 
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            SizedBox(height: 23),
            Center(
             //add image here
             child: Image.asset('assets/check.png',height: 120,),
            ),
            
              
             //add image here
             
           
            SizedBox(height: 30),
           
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
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
              
             ),
             
            ),
            SizedBox(height: 30),
           Center(
             child: Text(
                  "You are at elevator $code !",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color:Color.fromARGB(255, 57, 158, 119),
                  ),
                  textAlign: TextAlign.center,
                ),
           ),
            //show qr code here
             QrImage(
              data: code,
              size:150,
               version:QrVersions.auto
               ),
           
           
             Container(
  
              margin: EdgeInsets.only(top:60,right: 30,left: 30),
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
               padding: const EdgeInsets.only(top:70.0,right: 30),
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
  }}
 