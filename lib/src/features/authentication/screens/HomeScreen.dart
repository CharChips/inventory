import 'package:flutter/material.dart';
import 'package:inventory/src/features/authentication/screens/login/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}



class _HomescreenState extends State<Homescreen> {


   final supabase=Supabase.instance.client;
  Future<void> emailsignout()async{

    final response=await supabase.auth.signOut(
      scope: SignOutScope.global
    );
      print('Signout successful');
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: TextButton(onPressed: (){
            emailsignout();
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
          }
          , child: Text('LogOut')),
        ),
      ),
    );
  }
}