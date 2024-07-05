import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Classscreen extends StatefulWidget {
  const Classscreen({required this.title, super.key});

  final String title;
  //final List<Map<String,String>> componentList;

  @override
  State<Classscreen> createState() => _ClassscreenState();
}

class _ClassscreenState extends State<Classscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 154, 210, 255),
          Color.fromARGB(255, 213, 245, 252),
          Color.fromARGB(255, 242, 254, 255)
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 80, left: 40, right: 40, bottom: 20),
            child: Text(
              '${widget.title}',
              style: GoogleFonts.lato(
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                  border: Border.all(
                width: 2,
                color: Colors.black,
              )),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 2,
                      color: Colors.black,
                    ))),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Name",
                          style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 4, 43, 73)),
                        ),
                        SizedBox(
                          width: 135,
                        ),
                        Row(
                          children: [
                            Text("Box No",
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 4, 43, 73))),
                            SizedBox(
                              width: 30,
                            ),
                            Text("Stock",
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 4, 43, 73))),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text("Arduino Nano",style: GoogleFonts.lato(
                            fontSize: 20,

                          ),),
                           SizedBox(
                          width: 70,
                        ),
                                   Text("MC-04",style: GoogleFonts.lato(
                            fontSize: 20,

                          ),),
                          SizedBox(
                              width: 40,
                            ),
                              Text("3",style: GoogleFonts.lato(
                            fontSize: 20,

                          ),),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Arduino Uno",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            "MC-02",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 44,
                          ),
                          Text(
                            "7",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
