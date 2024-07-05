import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/features/authentication/controllers/componentController.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Newentry extends StatefulWidget {
  const Newentry({super.key});

  @override
  State<Newentry> createState() => _NewentryState();
}

class _NewentryState extends State<Newentry> {
  final TextEditingController barcodecontroller = TextEditingController();
  final Componentcontroller componentcontroller =
      Get.put(Componentcontroller());
  final supabase = Supabase.instance.client;
  final TextEditingController boxnocontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String _scanBarcode = 'Unknown';
    // String boxno = '';
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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 98, 193, 240),
                  Color.fromARGB(255, 13, 56, 211),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
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
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 4, 13, 56)),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: TextFormField(
              controller: barcodecontroller,
              maxLines: 6,
              minLines: 1,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "SKU ID",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: const Color.fromARGB(255, 136, 136, 136))),
                ),
              ),
            ),
          ),
        ),
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
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "Box No.",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: const Color.fromARGB(255, 129, 128, 128))),
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
            // boxno = boxnocontroller.text;
            await supabase.from('componentregister').insert({
              'skuid': barcodecontroller.text,
              'name': componentcontroller.CompName.value,
              'boxno': componentcontroller.Boxname.value
            });
          },
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 98, 193, 240),
                  Color.fromARGB(255, 13, 56, 211),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
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
