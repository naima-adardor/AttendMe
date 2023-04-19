import 'package:attend_me/Screens/qr_scanner_overlay.dart';
import 'package:attend_me/Screens/success_checkin_page.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gap/gap.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../constants/colors.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
   
 /* late QRViewController controller;
  String qrText = '';
*/
 //var qrstr = "Have a nice day ! \n It's check-in time punch in your attendance to mark your presence for the day.";
  var height,width;
 // bool _isQrScanned = false;
 bool isScanCompleted = false;
 void closeScreen(){
   isScanCompleted = false; 
 }
 bool isFlashOn=false;
 bool isFrontCamera=false;
 MobileScannerController controller = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      drawer:const Drawer() ,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isFlashOn = !isFlashOn;
            });
           
              controller.toggleTorch();
           
          }, icon: Icon(Icons.flash_on,color:isFlashOn ? maincolor : Colors.grey,)),
          IconButton(onPressed: (){
            setState(() {
              isFrontCamera = !isFrontCamera;
            });
           
            controller.switchCamera();  
            
          }, icon: Icon(Icons.camera_front,color:isFrontCamera ? maincolor: Colors.grey,)),
       
        ],
        iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Scanning Qr Code',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 133, 118, 118)),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 133, 118, 118)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 1,
        ),
      
     /* body: Padding(
        padding: const EdgeInsets.only(top:100.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                qrstr,
                 style: TextStyle(
                    fontSize: width/22,
                    fontWeight: FontWeight.bold,
                    color:maincolor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(25),
                 if (!_isQrScanned)
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6096B4),
                          elevation: 9,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
              onPressed: scanQr, 
              child: Text(("Let\'s Go"),style: TextStyle(color: Colors.white,fontSize:width/22,fontWeight: FontWeight.bold
             
              ))),
              SizedBox(height: width,)
            ],
          ),
        ),
      )*/
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child:Column(
          children: [
            Expanded(
           child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Place the QR code inside the frame",
             style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 75, 72, 72),
                      ),
                      textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
              Text(
                "Scanning will be started automatically",
             style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 163, 158, 158),
                      ),
                      textAlign: TextAlign.center,
                  ),
            ],
           ),
            ),
            
             Expanded(
              flex:2,
              child: Stack(
                children: [
                  MobileScanner(
                    controller: controller,
              allowDuplicates: true,
              onDetect: (Barcode,args){
                if(!isScanCompleted){
                  String code=Barcode.rawValue ?? '---';
                  isScanCompleted = true;
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SucessCheckinPage(code:code,closeScreen: closeScreen)));
                }
                



              },
              
            ),
            
           // Display the QR code overlay
          
           const QRScannerOverlay(overlayColour: const Color.fromARGB(255, 255, 255, 255),),
                ],
              )
              ,
            ),
             Expanded(child: Container(
             alignment:Alignment.center, 
             child: const Text(
                ". . . . . . . . . . ",
             style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 163, 158, 158),
                      ),
                      textAlign: TextAlign.center,
                  ),
            ),
            ),
          ],
        ),
      ),
    );
  }


  
}