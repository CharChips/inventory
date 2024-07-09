import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/data/model.dart';
import 'package:inventory/src/data/outputComponent.dart';
import 'package:inventory/src/features/authentication/controllers/componentController.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ComponentInClassScreen extends StatefulWidget {
  final Component component;

  ComponentInClassScreen({required this.component});

  @override
  State<ComponentInClassScreen> createState() => _ComponentInClassScreenState();
}

class _ComponentInClassScreenState extends State<ComponentInClassScreen> {
  final supabase = Supabase.instance.client;
  final ComponentController componentControl = Get.put(ComponentController());
 
  List<Outputcomponent> newres = [];

 void fetcher() async {
  final response = await supabase
      .from(componentControl.ClassName.value)
      .select('*');

  print('Response type: ${response.runtimeType}');
  print('Response: $response');

  if (response is List) {
    for (var entry in response) {
      newres.add(Outputcomponent(
        skuid: entry['skuid'].toString(),
        boxNo: entry['boxno'].toString(),
        stock: entry['stock'],
      ));
    }
    setState(() {});
  } else {
    print("Error: Response is not a list or map");
  }
}

  @override
  void initState() {
    super.initState();
    fetcher();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.component.name),
      ),
      body: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 40),
              child: Text(
                widget.component.name,
                style: GoogleFonts.lato(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                )),
                child: Column(
                  children: [
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(
                        color: Colors.black,
                      ))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "SkuId",
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 140,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Box No",
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                "Stock",
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: newres.length,
                        itemBuilder: (ctx, index) {
                          final component = newres[index];
                          return Container(
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(
                              color: Colors.black,
                            ))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  component.skuid.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 140,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      component.boxNo.toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      component.stock.toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
