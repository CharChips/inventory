import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/data/cartcomponent.dart';
import 'package:inventory/src/features/authentication/controllers/componentController.dart';
import 'package:inventory/src/features/main_app/cartscreen.dart/cartscreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String _scanBarcode = 'Unknown';
  late String barcode;
  late String compname = '';
  bool returnstate = false;

  final ComponentController componentcontroller =
      Get.put(ComponentController());

  final transactionidcontroller = TextEditingController();
  final returnTransactionIdController = TextEditingController();

  Future<bool> checkStockAvailability(String skuid) async {
    try {
      print('Checking stock in table: ${componentcontroller.ClassName.value}');
      print('Checking for SKUID: $skuid');

      if (componentcontroller.ClassName.value.isEmpty) {
        print('Table name is not set!');
        return false;
      }

      final response = await Supabase.instance.client
          .from(componentcontroller.ClassName.value)
          .select()
          .eq('skuid', skuid)
          .maybeSingle();

      print('Full response from Supabase: $response');

      if (response != null) {
        var stockValue = response['stock'];
        print('Raw stock value: $stockValue');

        int currentStock = 0;

        if (stockValue != null) {
          if (stockValue is String) {
            currentStock = int.parse(stockValue);
          } else if (stockValue is num) {
            currentStock = stockValue.toInt();
          }
        }

        print('Parsed stock value: $currentStock');
        return currentStock > 0;
      } else {
        print('No stock found for SKUID: $skuid');
        return false;
      }
    } catch (e) {
      print('Error checking stock: $e');
      return false;
    }
  }

  Future<void> fetchTransactionComponents(String transactionId) async {
    if (transactionId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid transaction ID')),
      );
      return;
    }

    try {
      final response = await Supabase.instance.client
          .from('Transactions')
          .select()
          .eq('transaction_id', transactionId)
          .single();

      if (response != null) {
        // Check if the transaction is already returned
        if (response['status'] == 'Returned') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('This transaction has already been returned')),
          );
          return;
        }

        // Set the transaction ID in the controller
        componentcontroller.transactionid.value =
            returnTransactionIdController.text;

        // Clear existing cart components
        componentcontroller.Cartcomponents.clear();

        // Parse the package JSON array
        List<dynamic> components = response['package'];

        // Add each component to the cart
        for (var comp in components) {
          componentcontroller.Cartcomponents.add(Cartcomponent(
            compname: comp['compname'],
            skuid: comp['skuid'],
            Quantity: comp['Quantity'],
          ));
        }
        setState(() {
          returnstate = true;
          componentcontroller.Status.value = 'Returned';
          componentcontroller.returnorissue.value = true;
        });
      }
    } catch (e) {
      print('Error fetching transaction: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Transaction not found or error occurred')),
      );
    }
  }

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
                  // Proceed with barcode scanning
                  String barcodeScanRes;
                  try {
                    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                        '#ff6666', 'Cancel', true, ScanMode.BARCODE);
                    print('Scanned barcode: $barcodeScanRes');
                  } on PlatformException {
                    barcodeScanRes = 'Failed to get platform version.';
                  }

                  if (!mounted) return;

                  setState(() {
                    _scanBarcode = barcodeScanRes;
                    barcode = _scanBarcode;
                  });

                  // Only proceed if we got a valid barcode
                  if (barcodeScanRes != '-1' &&
                      barcodeScanRes != 'Failed to get platform version.') {
                    // Analyze the SKUID to set ClassName, CompName, and Boxname
                    componentcontroller.skuidanalyze(barcode);

                    // Debug: Print the ClassName after analyzing the SKUID
                    print(
                        'ClassName after skuidanalyze: ${componentcontroller.ClassName.value}');

                    // Check stock availability before proceeding
                    bool hasStock = await checkStockAvailability(barcode);
                    print('Has stock: $hasStock');

                    if (!hasStock) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('No stock available for this component'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    // If stock is available, proceed with adding to cart
                    setState(() {
                      componentcontroller.Cartcomponents.add(Cartcomponent(
                          compname: componentcontroller.CompName.value,
                          skuid: barcode,
                          Quantity: componentcontroller.Quantity.value));
                    });
                  }
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Enter Transaction ID'),
                        content: TextField(
                          controller: returnTransactionIdController,
                          decoration: InputDecoration(
                            hintText: 'Transaction ID',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              print(
                                  'Transaction ID from dialog: ${returnTransactionIdController.text}');
                              componentcontroller.transactionid.value =
                                  returnTransactionIdController.text;
                              print(
                                  'Transaction ID from controller: ${componentcontroller.transactionid.value}');
                              await fetchTransactionComponents(
                                  returnTransactionIdController.text);
                              Navigator.pop(context);
                              returnTransactionIdController.clear();
                            },
                            child: Text('Submit'),
                          ),
                        ],
                      );
                    },
                  );
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
                    'Enter Return Transaction ID',
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
                  print(
                      'Navigating with Transaction ID: ${componentcontroller.transactionid.value}');
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
