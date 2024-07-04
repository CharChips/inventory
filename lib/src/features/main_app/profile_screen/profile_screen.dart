import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:google_fonts/google_fonts.dart';
=======
import 'package:get/get.dart';
import 'package:inventory/src/features/authentication/controllers/emailcontroller.dart';
>>>>>>> aditya
import 'package:inventory/src/features/authentication/screens/log_out_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

   
  final _supabase = Supabase.instance.client;
  final  Emailcontroller emailGet=Get.put(Emailcontroller()); 


   void naamkaran()async{

  final response=await _supabase.from('admins').select().eq('emailid', emailGet.emailget.value);
   final data=response.first;
   emailGet.Namefrommail.value=data['name'];
}

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    naamkaran();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        backgroundColor: Color(0xffC5E3FF),
        title: Text(
          'Profile',
          style: GoogleFonts.montserrat(
            color: Colors.black87,
            fontWeight: FontWeight.bold, // Adjust the font weight as needed
          ),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            color: Color(0xffC5E3FF),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 85,
              ),
            ),
          ),
          LogOUtWidget()
        ],
=======
      appBar: AppBar(title: const Text('My Profile')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 118, 184, 238),
          Color.fromARGB(255, 213, 245, 252),
          Color.fromARGB(255, 242, 254, 255)
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      )),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              
              width: 120,
              height: 120,
              margin: EdgeInsets.all(20),
              child: Image(image: AssetImage("assets/images/dp.png")),
            ),
          Obx(
            ()=> Center(
              child: Text(emailGet.Namefrommail.value,style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w300,
                color: Colors.black
              ),),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: LogOUtWidget(),
        ),
        SizedBox(height: 400),
          ],
        ),
>>>>>>> aditya
      ),
    );
  }
}
