//-----components_inClass_list_page----

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({required this.cat_name, super.key});

  final String cat_name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Component List',
      //     style: GoogleFonts.montserrat(
      //       color: Colors.black87,
      //       fontWeight: FontWeight.bold, // Adjust the font weight as needed
      //     ),
      //   ),
      //   backgroundColor: Color(0xffC5E3FF),
      // ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(20),
              //   child: Text(
              //     '${cat_name}',
              //     style: GoogleFonts.lato(
              //       color: Colors.black,
              //       fontSize: 30,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
