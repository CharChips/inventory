import 'package:flutter/material.dart';
import 'package:inventory/src/features/main_app/category_screen/category_screen.dart';
import 'package:inventory/src/features/main_app/dashboard/classes_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CategoryScreen(cat_name: 'Microcontroller')));
                },
                child: ClassContainer(label: "Microcontroller", stock: 22)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CategoryScreen(cat_name: 'Communication Modules')));
                },
                child:
                    ClassContainer(label: "Communication Modules", stock: 19)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CategoryScreen(cat_name: 'Sensors')));
                },
                child: ClassContainer(label: "Sensors", stock: 26)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CategoryScreen(cat_name: 'Display & Indicators')));
                },
                child:
                    ClassContainer(label: "Display & Indicators", stock: 13)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CategoryScreen(cat_name: 'Audio Modules')));
                },
                child: ClassContainer(label: "Audio Modules", stock: 5)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CategoryScreen(cat_name: 'Transistors and Diodes')));
                },
                child:
                    ClassContainer(label: "Transistors and Diodes", stock: 8)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CategoryScreen(cat_name: 'Microcontroller')));
                },
                child: ClassContainer(label: "Actuators and Motors", stock: 7)),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CategoryScreen(cat_name: 'Microcontroller')));
                },
                child: ClassContainer(label: "Actuators and Motors", stock: 7)),
          ],
        ),
      ),
    );
  }
}
