import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/features/authentication/screens/log_out_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
    );
  }
}
