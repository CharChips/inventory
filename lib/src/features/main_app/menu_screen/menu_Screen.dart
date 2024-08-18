import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/features/main_app/menu_screen/DetailScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class fetcheddata {
  String MemberName;
  List<dynamic> packageitems;
  String issueDate;
  String? ReturnDate;
  String SKU;

  fetcheddata(
      {required this.MemberName,
      required this.packageitems,
      required this.issueDate,
      required this.SKU,
      required this.ReturnDate});
}

class MenuScreen extends StatefulWidget {
  MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final supabase = Supabase.instance.client;

  List<fetcheddata> fetchedlist = [];

  void fetchpackage() async {
    final fetchedpackage = await supabase.from('Transactions').select();

    for (var item in fetchedpackage) {
      print(item['package']);
      fetchedlist.add(fetcheddata(
        MemberName: item['name'],
        packageitems: item['package'],
        issueDate: item['issuedate'],
        ReturnDate: item['returndate'],
        SKU: item['sku'],
      ));
    }
    print(fetchedlist);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchpackage();
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
                  .map<String>(((item) => item['compname'].toString()))
                  .toList();

              final item1 = itemNames[0];
              final item2 = itemNames.length > 1 ? itemNames[1] : '';

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        fetchedcomp: fetcedcomp,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(39, 5, 168, 244),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            '${item1}, ${item2}...',
                            style: GoogleFonts.lato(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'SKU: ${fetcedcomp.SKU}',
                            style: GoogleFonts.lato(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Member: ${fetcedcomp.MemberName}',
                            style: GoogleFonts.lato(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Issued On: ${fetcedcomp.issueDate}',
                            style: GoogleFonts.lato(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Returned On: ${fetcedcomp.ReturnDate ?? 'Not Returned'}',
                            style: GoogleFonts.lato(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
