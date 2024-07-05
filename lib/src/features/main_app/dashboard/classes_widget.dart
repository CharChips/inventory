import 'package:flutter/material.dart';
import 'package:inventory/src/features/main_app/dashboard/classScreen.dart';

class ClassContainer extends StatelessWidget {
  final String label;
  final int stock;

  ClassContainer({required this.label, required this.stock});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Classscreen(title: label)));
      },
      splashColor: Color.fromARGB(255, 211, 220, 242),
      child: Container(
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(109, 214, 244, 255)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              stock.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
