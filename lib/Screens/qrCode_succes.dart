import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class GeneratedCodePageSuccess extends StatelessWidget {
  const GeneratedCodePageSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    const path = "assets/qr_code_gene.png";
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.06,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    top: screenSize.height * 0.02,
                    bottom: screenSize.height * 0.02,
                    left: screenSize.width * 0.05,
                    right: screenSize.width * 0.05,
                  ),
                  height: screenSize.height * 0.08,
                  width: screenSize.width * 0.86,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 229, 229),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(66, 102, 102, 102),
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    children: [
                      Gap(screenSize.width * 0.04),
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      Gap(screenSize.height * 0.04),
                      Text(
                        "ELJID Naima",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 24, 94, 133),
                            fontSize: screenSize.width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(screenSize.height * 0.04),
              Center(
                child: Text(
                  "Download your QR code to share your attendance for today's session",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: screenSize.width * 0.05,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(screenSize.height * 0.05),
              SizedBox(
                height: screenSize.height * 0.29,
                child: Image.asset(
                  path,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.035,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenSize.height * 0.175,
                    height: screenSize.height * 0.15,
                    child: IconButton(
                      onPressed: () async {
                        try {
                          // Load the image file from the assets folder
                          final data = await rootBundle.load(path);
                          final bytes = data.buffer.asUint8List();

                          // Save the image to the device's gallery
                          final result =
                              await ImageGallerySaver.saveImage(bytes);

                          if (result != null) {
                            print('Image saved to gallery.');
                            Fluttertoast.showToast(
                              msg: 'Image saved!',
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          } else {
                            print('Error saving image to gallery.');
                          }
                        } catch (e) {
                          print('Error: $e');
                        }
                      },
                      icon: Icon(
                        Icons.download_for_offline,
                        color: const Color.fromARGB(255, 25, 129, 21),
                        size: screenSize.height * 0.16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
