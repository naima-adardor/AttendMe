import 'package:attend_me/Screens/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
    final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 255, 255, 255), 
         title: const Padding(
           padding:  EdgeInsets.only(left: 45),
           child:  Text(
            'Forgot Password',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromARGB(255, 133, 118, 118)
            ),
            
                 ),
         ),
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          color: Color.fromARGB(255, 133, 118, 118)),        
            onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
       body: SingleChildScrollView(
  child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
           child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Gap(0),
                Center(
                  child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                    child: Stack(
                      
                      children: [
                        Positioned(
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                color: const Color(0xFF6096B4),
                                shape: BoxShape.circle,
                                border: Border.all(
                    width: 100,
                    color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                                                     Center(
                                                       child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                                                         child: Container(
                                                          height: 180,
                                                          width: 180,
                                                          child: Center(child: Image.asset("assets/forgotPass.png"))),
                                                       ),
                                                     ),
                  
                        
                      
                      ],
                    ),
                  ),
                ),
                 
                Container(
  
   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5), // Set margin on all sides
  child:const Text(
                  "Please enter your Number Phone to receive a verification code",
                  style: TextStyle(
                    fontSize: 16,
                    
                  fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 88, 84, 84),
                  ),
                  textAlign: TextAlign.center,
                ),
                ),
                const Gap(15),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: TextFormField(
                  
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 112, 112, 112),
                      ),
                     focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(
                          color:   Color.fromARGB(255, 141, 141, 141),
                       
                        ),
                      ),
                      prefixIcon:  Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 141, 141, 141),
                      ),
                    ),
                  ),
                ),
              
              const Gap(55),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6096B4),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(35))),
                    onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => VerificationPage()),
            );
          },
                    child: const Text(
                      "Send",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Gap(30),
              ],
            ),
          ),
          )
       )
    );
  }
}
