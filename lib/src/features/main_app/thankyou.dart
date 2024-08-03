import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/common_widgets/app_bar.dart';
import 'package:inventory/src/features/authentication/controllers/thankyoucontroller.dart';

class Thankyou extends StatelessWidget {
   Thankyou({super.key});

  final Thankyoucontroller thankyoucontroller=Get.put(Thankyoucontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: CustomAppBar(),
     body:
Container(
  decoration: BoxDecoration(
     gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 154, 210, 255),
                Color.fromARGB(255, 213, 245, 252),
                Color.fromARGB(255, 242, 254, 255)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),

  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 50),
      Image(image: AssetImage("assets/logo/tick3.gif")),
      SizedBox(height: 20),
      Text("Transaction Successful!",style: GoogleFonts.lato(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w700
      ),)
    ],
  ),
)
    );
}
}