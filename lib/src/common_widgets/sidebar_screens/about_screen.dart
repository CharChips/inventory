import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: GoogleFonts.montserrat(
            color: Colors.black87,
            fontWeight: FontWeight.bold, // Adjust the font weight as needed
          ),
        ),
        backgroundColor: Color(0xffC5E3FF),
      ),
      body: Text("This is the about page"),
    );
  }
}
