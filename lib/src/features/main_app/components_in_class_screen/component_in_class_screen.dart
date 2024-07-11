import 'package:flutter/material.dart';
import 'package:inventory/src/data/model.dart';

class ComponentInClassScreen extends StatelessWidget {
  final Component component;

  ComponentInClassScreen({required this.component});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(component.name),
        backgroundColor: Color(0xffC5E3FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${component.name}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Box No: ${component.boxNo}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Stock: ${component.stock}', style: TextStyle(fontSize: 18)),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
