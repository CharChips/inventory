import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/features/authentication/screens/login/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogOUtWidget extends StatefulWidget {
  LogOUtWidget({super.key});

  @override
  State<LogOUtWidget> createState() => _LogOUtWidgetState();
}

class _LogOUtWidgetState extends State<LogOUtWidget> {
  final supabase = Supabase.instance.client;
  Future<void> emailsignout() async {
    final response = await supabase.auth.signOut(scope: SignOutScope.global);
    print('Signout successful');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Color(0xff8FC8EB)),
      child: TextButton(
          onPressed: () {
            emailsignout();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Text('Logout',
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
    );
  }
}
