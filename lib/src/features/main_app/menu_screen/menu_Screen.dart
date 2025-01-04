// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:inventory/src/features/authentication/controllers/componentController.dart';
// import 'package:inventory/src/features/main_app/menu_screen/DetailScreen.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class fetcheddata {
//   String MemberName;
//   List<dynamic> packageitems;
//   String issueDate;
//   String? ReturnDate;
//   String transaction_id;
//   String div;
//   int phonenumber;

//   fetcheddata(
//       {required this.MemberName,
//       required this.packageitems,
//       required this.issueDate,
//       required this.ReturnDate,
//       required this.transaction_id,
//       required this.div,
//       required this.phonenumber});
// }

// class MenuScreen extends StatefulWidget {
//   MenuScreen({super.key});

//   @override
//   State<MenuScreen> createState() => _MenuScreenState();
// }

// class _MenuScreenState extends State<MenuScreen> {
//   final supabase = Supabase.instance.client;
//   final ComponentController componentcontroller =
//       Get.put(ComponentController());
//   List<fetcheddata> fetchedlist = [];

//   void fetchpackage() async {
//     final fetchedpackage = await supabase.from('Transactions').select();

//     for (var item in fetchedpackage) {
//       print(item['package']);
//       fetchedlist.add(fetcheddata(
//           MemberName: item['name'],
//           packageitems: item['package'],
//           issueDate: item['issuedate'],
//           ReturnDate: item['returndate'],
//           transaction_id: item['transaction_id'],
//           div: item['class'],
//           phonenumber: item['phonenumber']));
//     }
//     print(fetchedlist);

//     setState(() {});
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchpackage();
//   }

//   void _onItemTap(fetcheddata fetchedComp) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => DetailScreen(fetchedcomp: fetchedComp),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       height: MediaQuery.of(context).size.height * 1,
//       width: MediaQuery.of(context).size.width * 1,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color.fromARGB(255, 154, 210, 255),
//             Color.fromARGB(255, 213, 245, 252),
//             Color.fromARGB(255, 242, 254, 255)
//           ],
//           begin: Alignment.bottomCenter,
//           end: Alignment.topCenter,
//         ),
//       ),
//       child: SingleChildScrollView(
//         child: ListView.builder(
//             shrinkWrap: true, // Add this
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: fetchedlist.length,
//             itemBuilder: (ctx, index) {
//               final fetcedcomp = fetchedlist[index];
//               final List<String> itemNames = fetcedcomp.packageitems
//                   .map<String>(((item) => item['compname'].toString()))
//                   .toList();
//               print(itemNames);

//               final item1 = itemNames[0];
//               final item2 = itemNames.length > 1 ? itemNames[1] : '';

//               return GestureDetector(
//                 onTap: () => _onItemTap(fetcedcomp),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     height: MediaQuery.of(context).size.width * 0.6,
//                     decoration: BoxDecoration(
//                         color: Color.fromARGB(39, 5, 168, 244),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(16),
//                         )),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10, left: 10),
//                           child: Text(
//                             '${item1},${item2}...',
//                             style: GoogleFonts.lato(
//                                 color: Colors.black, fontSize: 20),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10, left: 10),
//                           child: Text(
//                             'Member:${fetcedcomp.MemberName}',
//                             style: GoogleFonts.lato(
//                                 color: Colors.black, fontSize: 17),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10, left: 10),
//                           child: Text(
//                             'Issued On:${fetcedcomp.issueDate}',
//                             style: GoogleFonts.lato(
//                                 color: Colors.black, fontSize: 17),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10, left: 10),
//                           child: Text(
//                             'Returned On:${fetcedcomp.ReturnDate ?? 'Not Returned'}',
//                             style: GoogleFonts.lato(
//                                 color: Colors.black, fontSize: 17),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10, left: 10),
//                           child: Text(
//                             'Transaction Id:${fetcedcomp.transaction_id}',
//                             style: GoogleFonts.lato(
//                                 color: Colors.black, fontSize: 17),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }),
//       ),
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/features/authentication/controllers/componentController.dart';
import 'package:inventory/src/features/main_app/menu_screen/DetailScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class fetcheddata {
  String MemberName;
  List<dynamic> packageitems;
  String issueDate;
  String? ReturnDate;
  String transaction_id;
  String div;
  int phonenumber;
  String? profileImageUrl; // Explicitly marked as nullable

  fetcheddata({
    required this.MemberName,
    required this.packageitems,
    required this.issueDate,
    this.ReturnDate,
    required this.transaction_id,
    required this.div,
    required this.phonenumber,
    this.profileImageUrl, // Made optional in constructor
  });
}

class MenuScreen extends StatefulWidget {
  MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final supabase = Supabase.instance.client;
  final ComponentController componentcontroller =
      Get.put(ComponentController());
  List<fetcheddata> fetchedlist = [];

  void fetchpackage() async {
    try {
      final fetchedpackage = await supabase.from('Transactions').select();
      fetchedlist.clear();

      for (var item in fetchedpackage) {
        try {
          String? imageUrl;

          // Only try to fetch profile if we have a valid ID
          if (item['id'] != null) {
            final profileData = await supabase
                .from('profiles')
                .select('profile_image_url')
                .eq('member_id', item['id'].toString())
                .maybeSingle();

            // Safely extract the URL, keeping it null if not found
            imageUrl = profileData?['profile_image_url']?.toString();
          }

          // Create fetcheddata object with null-safe values
          fetchedlist.add(fetcheddata(
            MemberName: (item['name'] ?? '').toString(),
            packageitems: item['package'] ?? [],
            issueDate: (item['issuedate'] ?? '').toString(),
            ReturnDate: item['returndate']?.toString(),
            transaction_id: (item['transaction_id'] ?? '').toString(),
            div: (item['class'] ?? '').toString(),
            phonenumber:
                int.tryParse(item['phonenumber']?.toString() ?? '0') ?? 0,
            profileImageUrl: imageUrl, // This can be null
          ));
        } catch (e) {
          print('Error fetching profile for transaction ${item['id']}: $e');
          // Add the item without profile image
          fetchedlist.add(fetcheddata(
            MemberName: (item['name'] ?? '').toString(),
            packageitems: item['package'] ?? [],
            issueDate: (item['issuedate'] ?? '').toString(),
            ReturnDate: item['returndate']?.toString(),
            transaction_id: (item['transaction_id'] ?? '').toString(),
            div: (item['class'] ?? '').toString(),
            phonenumber:
                int.tryParse(item['phonenumber']?.toString() ?? '0') ?? 0,
            profileImageUrl: null, // Explicitly set to null on error
          ));
        }
      }

      setState(() {});
    } catch (e) {
      print('Main error in fetchpackage: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchpackage();
  }

  void _onItemTap(fetcheddata fetchedComp) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(fetchedcomp: fetchedComp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 154, 210, 255),
              Color.fromARGB(255, 213, 245, 252),
              Color.fromARGB(255, 242, 254, 255)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: fetchedlist.length,
            itemBuilder: (ctx, index) {
              final fetcedcomp = fetchedlist[index];
              final List<String> itemNames = fetcedcomp.packageitems
                  .map<String>((item) => item['compname'].toString())
                  .toList();

              final item1 = itemNames[0];
              final item2 = itemNames.length > 1 ? itemNames[1] : '';

              return GestureDetector(
                onTap: () => _onItemTap(fetcedcomp),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width *
                        0.7, // Increased height to accommodate profile image
                    decoration: BoxDecoration(
                      color: Color.fromARGB(39, 5, 168, 244),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${item1},${item2}...',
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Member:${fetcedcomp.MemberName}',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Issued On:${fetcedcomp.issueDate}',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Returned On:${fetcedcomp.ReturnDate ?? 'Not Returned'}',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Transaction Id:${fetcedcomp.transaction_id}',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
