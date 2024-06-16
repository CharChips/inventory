import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Text("Welcome to the app"),
          Row(
            children: [
              OutlinedButton(onPressed: () {}, child: Text("Login")),
              ElevatedButton(onPressed: () {}, child: Text("SignUp"))
            ],
          )
        ],
      ),
    ));
  }
}
