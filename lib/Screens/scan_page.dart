import 'package:flutter/material.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gap/gap.dart';

import '../constants/colors.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
   
 /* late QRViewController controller;
  String qrText = '';
*/
 var qrstr = "Have a nice day ! \n It's check-in time punch in your attendance to mark your presence for the day.";
  var height,width;
  bool _isQrScanned = false;
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
      appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Padding(
            padding: EdgeInsets.only(left: 45),
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
        ),
      
      body: Padding(
        padding: const EdgeInsets.only(top:100.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                qrstr,
                 style: TextStyle(
                    fontSize: 22,
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
              child: Text(("Let\'s Go"),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
             
              ))),
              SizedBox(height: width,)
            ],
          ),
        ),
      )
    );
  }


  Future <void>scanQr()async{
    try{
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
        setState(() {
          qrstr=value;
           _isQrScanned = true;

        });
      });
    }catch(e){
      setState(() {
        qrstr='unable to read this';
      });
    }
  }
}