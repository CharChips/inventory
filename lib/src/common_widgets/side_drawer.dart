import 'package:flutter/material.dart';
import 'package:inventory/src/common_widgets/sidebar_screens/about_screen.dart';
import 'package:inventory/src/common_widgets/sidebar_screens/fine_policy_screen.dart';
import 'package:inventory/src/common_widgets/sidebar_screens/guidelines_screen.dart';
// import 'package:inventory/src/constants/image_strings.dart';

class CustomSideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.lightBlue[50], // Adjust the background color here
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue[100], // Adjust the header color here
              ),
              child: const SizedBox(
                  height: 40,
                  width: 40,
                  child: Image(
                      image: AssetImage(
                          "assets/images/isa-vesit-color-logo.png"))),
            ),
            ListTile(
              title: Text('T&C',style: TextStyle(
                color: Colors.black
              ),),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GuidelinesScreen()));
              },
            ),
            ListTile(
              title: Text('Fine Policy',style: TextStyle(
                color: Colors.black
              ),),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FinePolicyPdf()));
              },
            ),
            ListTile(
              title: Text('About',style: TextStyle(
                color: Colors.black
              ),),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AboutPage()));
              },
            ),
            // const Padding(
            //   padding: EdgeInsets.all(16.0),
            //   child: Text(
            //     'Version 1.0.0',
            //     style: TextStyle(
            //       fontStyle: FontStyle.italic,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
