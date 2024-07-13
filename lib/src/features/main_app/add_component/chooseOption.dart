import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/features/main_app/add_component/NewEntry_consumable.dart';
import 'package:inventory/src/features/main_app/add_component/add_component_bottom_pop_up%20copy.dart';
import 'package:inventory/src/features/main_app/add_component/add_component_bottom_pop_up.dart';

class Chooseoption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffC5E3FF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        // This helps in case the content overflows
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, right: 15, left: 15, bottom: 5),
              child: InkWell(
                onTap: () => AddCompBottomSheet(
                    context), // Adjust your function name as needed
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15), // Adjust padding as needed
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/motherboard.png',
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Add Non-Consumable component',
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: InkWell(
                onTap: () => AddConsumableSheet(
                    context), // Adjust your function name as needed
                child: Container(
                  width: double
                      .infinity, // This makes the container stretch the full width
                  padding: const EdgeInsets.all(15), // Adjust padding as needed
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/resistor.png',
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Add Consumable component',
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
