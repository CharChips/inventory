import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/data/cartcomponent.dart';
import 'package:inventory/src/features/authentication/controllers/componentController.dart';
import 'package:inventory/src/features/main_app/cartscreen.dart/cartscreen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String _scanBarcode = 'Unknown';
  late String barcode;
  late String compname = '';

  final ComponentController componentcontroller =
      Get.put(ComponentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  componentcontroller.Status.value='Issued';
                  componentcontroller.returnorissue.value=false;


                  String barcodeScanRes;
                  // Platform messages may fail, so we use a try/catch PlatformException.
                  try {
                    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                        '#ff6666', 'Cancel', true, ScanMode.BARCODE);
                    print(barcodeScanRes);
                  } on PlatformException {
                    barcodeScanRes = 'Failed to get platform version.';
                  }

                  // If the widget was removed from the tree while the asynchronous platform
                  // message was in flight, we want to discard the reply rather than calling
                  // setState to update our non-existent appearance.
                  if (!mounted) return;

                  setState(() {
                    _scanBarcode = barcodeScanRes;
                    barcode = _scanBarcode;
                    componentcontroller.skuidanalyze(barcode);
                    componentcontroller.Cartcomponents.add(Cartcomponent(
                        compname: componentcontroller.CompName.value,
                        skuid: barcode,
                        Quantity: componentcontroller.Quantity.value));
                  });
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
                    'Scan to issue component',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
               TextButton(
                onPressed: () async {
                  componentcontroller.Status.value='Returned';
                  componentcontroller.returnorissue.value=true;
                  String barcodeScanRes;
                  // Platform messages may fail, so we use a try/catch PlatformException.
                  try {
                    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                        '#ff6666', 'Cancel', true, ScanMode.BARCODE);
                    print(barcodeScanRes);
                  } on PlatformException {
                    barcodeScanRes = 'Failed to get platform version.';
                  }

                  // If the widget was removed from the tree while the asynchronous platform
                  // message was in flight, we want to discard the reply rather than calling
                  // setState to update our non-existent appearance.
                  if (!mounted) return;

                  setState(() {
                    _scanBarcode = barcodeScanRes;
                    barcode = _scanBarcode;
                    componentcontroller.skuidanalyze(barcode);
                    componentcontroller.Cartcomponents.add(Cartcomponent(
                        compname: componentcontroller.CompName.value,
                        skuid: barcode,
                        Quantity: componentcontroller.Quantity.value));
                  });
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
                    'Scan to return component',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
shrinkWrap: true, // Add this                    
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: componentcontroller.Cartcomponents.length,
                    itemBuilder: (ctx, index) {
                      final component =
                          componentcontroller.Cartcomponents[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 130,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(39, 5, 168, 244),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10),
                                    child: Text(
                                      component.skuid,
                                      style: GoogleFonts.lato(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 55,
                                    height: 0.2,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          componentcontroller.Cartcomponents
                                              .remove(component);
                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10),
                                    child: Text(component.compname,
                                        style: GoogleFonts.lato(
                                            color: Colors.black, fontSize: 15)),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              component.Quantity =
                                                  component.Quantity - 1;
                                            });
                                          },
                                          icon: Icon(Icons.remove)),
                                      Text(
                                        component.Quantity.toString(),
                                        style: GoogleFonts.lato(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              component.Quantity =
                                                  component.Quantity + 1;
                                            });
                                          },
                                          icon: Icon(Icons.add)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cartscreen()));
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
                    'View Cart',
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
    );
  }
}
