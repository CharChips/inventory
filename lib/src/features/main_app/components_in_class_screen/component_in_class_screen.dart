import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/data/model.dart';
// import 'package:inventory/src/data/outputComponent.dart';
import 'package:inventory/src/features/authentication/controllers/componentController.dart';
import 'package:inventory/src/features/authentication/controllers/selectquerycontroller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ComponentInClassScreen extends StatefulWidget {
  final Component component;

  ComponentInClassScreen({required this.component});

  @override
  _ComponentInClassScreenState createState() => _ComponentInClassScreenState();
}

class _ComponentInClassScreenState extends State<ComponentInClassScreen> {
  final supabase = Supabase.instance.client;
  final ComponentController componentControl = Get.put(ComponentController());
  final Selectquerycontroller selectquerycontroller =
      Get.put(Selectquerycontroller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectquerycontroller.newres.value.clear();
    selectquerycontroller.fetchComponents(widget.component.name);
  }

  //need a setstate to display the item

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            widget.component.name,
            style: const TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
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
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 35,
                          decoration: const BoxDecoration(
                            border: Border.symmetric(
                              horizontal: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "SkuId",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Box No",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Stock",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Warning",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => ListView.builder(
                              itemCount: selectquerycontroller.newres.length,
                              itemBuilder: (ctx, index) {
                                final listcomponent =
                                    selectquerycontroller.newres[index];

                                return Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                    border: Border.symmetric(
                                      horizontal:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          listcomponent.skuid.toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          listcomponent.boxNo.toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          listcomponent.stock.toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: listcomponent.warning
                                                  .toString()
                                                  .isNotEmpty
                                              ? GestureDetector(
                                                  onTap: () => {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          Dialog(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                        ),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            12),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .red
                                                                      .withOpacity(
                                                                          0.1),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Icon(
                                                                  Icons
                                                                      .warning_amber_rounded,
                                                                  color: Colors
                                                                      .red,
                                                                  size: 40,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 16),
                                                              Text(
                                                                'Warning',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 12),
                                                              Text(
                                                                listcomponent
                                                                    .warning
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  height: 1.5,
                                                                  color: Colors
                                                                      .red
                                                                      .shade700,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 20),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        context),
                                                                child: Text(
                                                                  'OK',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  },
                                                  child: Icon(
                                                      Icons
                                                          .warning_amber_rounded,
                                                      color: Colors.red,
                                                      size: 20),
                                                )
                                              : SizedBox(width: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
