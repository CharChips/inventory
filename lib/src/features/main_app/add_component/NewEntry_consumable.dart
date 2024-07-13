import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/features/authentication/controllers/componentController.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewConsumableentry extends StatefulWidget {
  const NewConsumableentry({super.key});

  @override
  State<NewConsumableentry> createState() => _NewConsumableentryState();
}

class _NewConsumableentryState extends State<NewConsumableentry> {
  final TextEditingController barcodecontroller = TextEditingController();
  final ComponentController componentcontroller =
      Get.put(ComponentController());
  final supabase = Supabase.instance.client;
  final TextEditingController boxnocontroller = TextEditingController();
  final TextEditingController stockcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String _scanBarcode = 'Unknown';
    String boxno = '';
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        TextButton(
          onPressed: () async {
            barcodecontroller.clear();
            componentcontroller.namecontroller.clear();

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
              barcodecontroller.text = _scanBarcode;
              componentcontroller.skuidanalyze(barcodecontroller.text);
            });
          },
          child: Container(
            width: 300,
            decoration: const BoxDecoration(
              color: Color(0xff19335A),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            child: Text(
              'Scan the Barcode',
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

        //  Padding(
        //       padding: const EdgeInsets.all(25.0),
        //       child: Container(
        //         decoration: BoxDecoration(
        //           border: Border.all(color: Color.fromARGB(255, 4, 13, 56)),
        //           borderRadius: BorderRadius.all(Radius.circular(8)),
        //         ),
        //         child: TextFormField(

        //           controller: barcodecontroller,
        //           maxLines: 6,
        //           minLines: 1,
        //           style: TextStyle(color: Colors.white),
        //           decoration: InputDecoration(
        //             border: OutlineInputBorder(),
        //             label: Text(
        //               "SKU ID",
        //               style: GoogleFonts.lato(textStyle: TextStyle(color: const Color.fromARGB(255, 136, 136, 136))),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 4, 13, 56)),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: TextField(
              controller: componentcontroller.namecontroller,
              maxLines: 6,
              minLines: 1,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "Name",
                  style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(color: Color.fromARGB(255, 141, 141, 141))),
                ),
              ),
            ),
          ),
        ),

        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 4, 13, 56)),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: TextFormField(
                  controller: componentcontroller.boxnocontroller,
                  maxLines: 6,
                  minLines: 1,
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "Box No.",
                      style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: Color.fromARGB(255, 6, 6, 6))),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 4, 13, 56)),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: TextFormField(
                  controller: stockcontroller,
                  maxLines: 6,
                  minLines: 1,
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "Stock",
                      style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: Color.fromARGB(255, 6, 6, 6))),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: 40,
        ),
        TextButton(
          onPressed: () async {
            await supabase.from(componentcontroller.ClassName.value).insert({
              'skuid':barcodecontroller.text,
              'stock': stockcontroller.text,
              'name': componentcontroller.CompName.value,
              'boxno': componentcontroller.Boxname.value
            });
            Navigator.pop(context);
          },
          child: Container(
            width: 300,
            decoration: const BoxDecoration(
              color: Color(0xff19335A),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            child: Text(
              'Add Component',
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
      ],
    );
  }
}
