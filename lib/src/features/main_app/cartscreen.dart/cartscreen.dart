import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/data/cartcomponent.dart';
import 'package:inventory/src/data/model.dart';
import 'package:inventory/src/features/authentication/controllers/componentController.dart';
import 'package:inventory/src/features/main_app/thankyou.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  final supabase = Supabase.instance.client;
  final TextEditingController Memberid = TextEditingController();
  final TextEditingController Name = TextEditingController();
  final TextEditingController PhoneNumber = TextEditingController();
  final TextEditingController Class = TextEditingController();

  final ComponentController componentcontroller =
      Get.put(ComponentController());

  Future<void> updateQuantity(Cartcomponent component) async {
    componentcontroller.skuidanalyze(component.skuid);
    final tablestock = await supabase
        .from(componentcontroller.ClassName.value)
        .select('stock')
        .eq('skuid', component.skuid);
    final stockvalue = tablestock [0]['stock']as int;
    final finalstock = stockvalue - component.Quantity;

    await supabase
        .from(componentcontroller.ClassName.value)
        .update({'stock': finalstock}).eq('skuid', component.skuid);
  }

  Future<void> insertCartComponents(String memberid, String name, String Class,
      String phonenumber, List<Cartcomponent> cartcomponents) async {
    List<Map<String, dynamic>> cartcomponentsJson =
        cartcomponents.map((co) => co.toJson()).toList();

    final data = {
      'memberid': memberid,
      'name': name,
      'class': Class,
      'phonenumber': phonenumber,
      'package': cartcomponentsJson
    };

    final response = await supabase.from('Transactions').insert(data);

  }

  @override
  Widget build(BuildContext context) {
    final ComponentController componentcontroller =
        Get.put(ComponentController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffC5E3FF), 
          elevation: 0, 
          leading: IconButton(
            icon:
                Icon(Icons.menu, color: Colors.black87), // Hamburger menu icon
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: Text(
            'ISA-VESIT',
            style: GoogleFonts.montserrat(
              color: Colors.black87,
              fontWeight: FontWeight.bold, 
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
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
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Member ID:",
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 3, 38, 66)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        controller: Memberid,
                        decoration: InputDecoration(
                          hintText: "Enter Member ID",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Name:",
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 3, 38, 66)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        controller: Name,
                        decoration: InputDecoration(
                          hintText: "Enter Name",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Class/Div",
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 3, 38, 66)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        controller: Class,
                        decoration: InputDecoration(
                          hintText: "Enter Class",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Phone Number:",
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 3, 38, 66)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: TextField(
                        controller: PhoneNumber,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter Phone no.",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Component List:",
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 3, 38, 66)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.27,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 131,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .transparent, // Transparent background
                                      border: Border.all(
                                        color: Colors.black, // Border color
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "SkuId",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 140,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .transparent, // Transparent background
                                      border: Border.all(
                                        color: Colors.black, // Border color
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      "Component Name",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .transparent, // Transparent background
                                      border: Border.all(
                                        color: Colors.black, // Border color
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      "Quantity",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ListView.builder(
                              shrinkWrap: true, // Add this
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  componentcontroller.Cartcomponents.length,
                              itemBuilder: (ctx, index) {
                                final component =
                                    componentcontroller.Cartcomponents[index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 131,
                                        height: 20,
                                        child: Text(
                                          component.skuid,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 140,
                                        height: 20,
                                        child: Text(
                                          component.compname,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            component.Quantity.toString(),
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () async {
                        await insertCartComponents(
                            Memberid.text,
                            Name.text,
                            Class.text,
                            PhoneNumber.text,
                            componentcontroller.Cartcomponents);

                        for (var item in componentcontroller.Cartcomponents) {
                          await updateQuantity(item);
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Thankyou()));
                      },
                      child: Container(
                        width: 300,
                        decoration: const BoxDecoration(
                          color: Color(0xff19335A),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        child: Text(
                          'Checkout',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
