import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/features/main_app/menu_screen/menu_Screen.dart';

class DetailScreen extends StatelessWidget {
  final fetcheddata fetchedcomp;

  DetailScreen({required this.fetchedcomp});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = fetchedcomp.packageitems
        .map<Map<String, dynamic>>((item) => item as Map<String, dynamic>)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Package Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Member Details'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Class: ${fetchedcomp.div}'),
                              Text('Phone Number: ${fetchedcomp.phonenumber}'),
                            ],
                          ),
                        ),
                      );
                    })
              },
              child: Text(
                'Member: ${fetchedcomp.MemberName}',
                style:
                    GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Package Items:',
              style:
                  GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            for (var item in items)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '- ${item['compname']} (SKU: ${item['skuid']})',
                  style: GoogleFonts.lato(fontSize: 18),
                ),
              ),
            SizedBox(height: 16),
            Text(
              'Issued On: ${fetchedcomp.issueDate}',
              style: GoogleFonts.lato(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Returned On: ${fetchedcomp.ReturnDate ?? 'Not Returned'}',
              style: GoogleFonts.lato(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
