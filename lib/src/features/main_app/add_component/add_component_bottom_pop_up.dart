import 'package:flutter/material.dart';
import 'package:inventory/src/features/authentication/screens/scanner_screen/scanner_screen.dart';

Future<dynamic> AddCompBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Add new component to database",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScannerScreen()));
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 104, 128, 173)
                          .withOpacity(0.5), // shadow color
                      spreadRadius: 1, // spread radius
                      blurRadius: 8, // blur radius
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(109, 214, 244, 255)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Scan Qr",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 104, 128, 173)
                          .withOpacity(0.5), // shadow color
                      spreadRadius: 1, // spread radius
                      blurRadius: 8, // blur radius
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(109, 214, 244, 255)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add manually",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
