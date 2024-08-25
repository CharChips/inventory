import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FetchedData {
  String memberName;
  List<dynamic> packageItems;
  String issueDate;
  String? returnDate;

  FetchedData({
    required this.memberName,
    required this.packageItems,
    required this.issueDate,
    this.returnDate,
  });
}

class MenuScreen extends StatefulWidget {
  MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final supabase = Supabase.instance.client;

  List<FetchedData> fetchedList = [];
  List<FetchedData> filteredList = [];

  String? selectedFilter;
  String searchQuery = '';

  void fetchPackage() async {
    final fetchedPackage = await supabase.from('Transactions').select();
    List<FetchedData> tempList = [];

    for (var item in fetchedPackage) {
      tempList.add(
        FetchedData(
          memberName: item['name'],
          packageItems: item['package'],
          issueDate: item['issuedate'],
          returnDate: item['returndate'],
        ),
      );
    }

    setState(() {
      fetchedList = tempList;
      applyFilters();
    });
  }

  void applyFilters() {
    setState(() {
      // Filter based on search query and selected filter
      filteredList = fetchedList.where((data) {
        // Search in memberName and package items
        final matchesMemberName = data.memberName.toLowerCase().contains(searchQuery.toLowerCase());
        final matchesPackageItems = data.packageItems.any((item) =>
            item['compname'].toString().toLowerCase().contains(searchQuery.toLowerCase()));

        return matchesMemberName || matchesPackageItems;
      }).toList();

      // Sort the filtered list based on the selected filter
      switch (selectedFilter) {
        case 'Member Name':
          filteredList.sort((a, b) => a.memberName.compareTo(b.memberName));
          break;
        case 'Issue Date':
          filteredList.sort((a, b) => a.issueDate.compareTo(b.issueDate));
          break;
        case 'Return Date':
          filteredList.sort((a, b) => (a.returnDate ?? '').compareTo(b.returnDate ?? ''));
          break;
        default:
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPackage();
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 11, 12, 37),
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        style: GoogleFonts.lato(color: Colors.black),
                        onChanged: (value) {
                          searchQuery = value;
                          applyFilters();
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      value: selectedFilter,
                      hint: Text(
                        'Filter by',
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 11, 12, 37),
                        ),
                      ),
                      items: [
                        'Member Name',
                        'Issue Date',
                        'Return Date',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 228, 227, 229),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedFilter = value;
                        applyFilters();
                      },
                      dropdownColor: Colors.black,
                      iconEnabledColor:
                          const Color.fromARGB(255, 11, 12, 37),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredList.length,
                itemBuilder: (ctx, index) {
                  final fetchedComp = filteredList[index];
                  final List<String> itemNames = fetchedComp.packageItems
                      .map<String>((item) => item['compname'].toString())
                      .toList();
                  final item1 = itemNames.isNotEmpty ? itemNames[0] : '';
                  final item2 = itemNames.length > 1 ? itemNames[1] : '';

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 200,
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
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: Text(
                              '${item1}, ${item2}...',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 15),
                            child: Text(
                              'Member: ${fetchedComp.memberName}',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 15),
                            child: Text(
                              'Issued On: ${fetchedComp.issueDate}',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 15),
                            child: Text(
                              'Returned On: ${fetchedComp.returnDate ?? 'Not Returned'}',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
