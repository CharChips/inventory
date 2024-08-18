import 'package:flutter/material.dart';
import 'package:inventory/src/features/main_app/dashboard/classes_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClassContainer(label: "Microcontroller", stock: 27),
            ClassContainer(label: "Communication Modules", stock: 20),
            ClassContainer(label: "Sensors", stock: 18),
            ClassContainer(label: "DisplaysandIndicators", stock: 13),
            ClassContainer(label: "Audio Modules", stock: 5),
            ClassContainer(label: "Transistors and Diodes", stock: 8),
            ClassContainer(label: "Actuators and Motors", stock: 8),
            ClassContainer(label: "Connectors and Switches", stock: 8),
          ],
        ),
      ),
    );
  }
}
