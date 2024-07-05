import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/src/features/authentication/controllers/emailcontroller.dart';
import 'package:inventory/src/features/authentication/screens/log_out_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _supabase = Supabase.instance.client;
  final Emailcontroller emailGet = Get.put(Emailcontroller());

  void naamkaran() async {
    final response = await _supabase
        .from('admins')
        .select()
        .eq('emailid', emailGet.emailget.value);
    final data = response.first;
    emailGet.Namefrommail.value = data['name'];
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
      appBar: AppBar(
          backgroundColor: Color(0xffC5E3FF), title: const Text('My Profile')),
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //   colors: [
        //     Color.fromARGB(255, 118, 184, 238),
        //     Color.fromARGB(255, 213, 245, 252),
        //     Color.fromARGB(255, 242, 254, 255)
        //   ],
        //   begin: Alignment.bottomCenter,
        //   end: Alignment.topCenter,
        // )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(color: Color(0xffC5E3FF)),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/dp.png"),
                    radius: 90,
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          emailGet.Namefrommail.value,
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: LogOUtWidget(),
            ),
            SizedBox(height: 400),
          ],
        ),
      ),
    );
  }
}
