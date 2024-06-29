// custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final String title;
  // final List<Widget>? actions;

  // CustomAppBar({required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[50], // Set the background color
      elevation: 0, // Remove the shadow
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black87), // Hamburger menu icon
        onPressed: () {
          // Add your onPressed code here!
        },
      ),
      title: Text(
        'ISA-VESIT',
        style: GoogleFonts.montserrat(
          color: Colors.black87,
          fontWeight: FontWeight.bold, // Adjust the font weight as needed
        ),
      ),
      actions: const [
        Padding(
            padding: EdgeInsets.all(18.0),
            child: Icon(Icons.account_circle_sharp)
            // CircleAvatar(
            //   backgroundImage: NetworkImage(
            //       'https://example.com/image.jpg'), // Replace with your image URL
            // ),
            ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
