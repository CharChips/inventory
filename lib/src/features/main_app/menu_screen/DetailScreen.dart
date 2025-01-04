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
        title: Text('Package Details', style: GoogleFonts.lato()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Member Details',
                              style: GoogleFonts.lato(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey[200],
                              child: fetchedcomp.profileImageUrl != null &&
                                      fetchedcomp.profileImageUrl!.isNotEmpty
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: Image.network(
                                        fetchedcomp.profileImageUrl!,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Icon(
                                            Icons.person,
                                            size: 60,
                                            color: Colors.grey[600],
                                          );
                                        },
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Icon(
                                      Icons.person,
                                      size: 60,
                                      color: Colors.grey[600],
                                    ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Name: ${fetchedcomp.MemberName}',
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Class: ${fetchedcomp.div}',
                              style: GoogleFonts.lato(fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Phone Number: ${fetchedcomp.phonenumber}',
                              style: GoogleFonts.lato(fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            TextButton(
                              child: Text(
                                'Close',
                                style: GoogleFonts.lato(fontSize: 16),
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                'Member: ${fetchedcomp.MemberName}',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Package Items:',
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
