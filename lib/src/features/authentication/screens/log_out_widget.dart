import 'package:flutter/material.dart';
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
      child: TextButton(
          onPressed: () {
            emailsignout();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Text('LogOut')),
    );
  }
}
