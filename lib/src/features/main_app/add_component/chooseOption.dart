import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/features/main_app/add_component/NewEntry%20copy.dart';
import 'package:inventory/src/features/main_app/add_component/NewEntry.dart';
import 'package:inventory/src/features/main_app/add_component/add_component_bottom_pop_up%20copy.dart';
import 'package:inventory/src/features/main_app/add_component/add_component_bottom_pop_up.dart';

class Chooseoption extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: 
         Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: ()=>AddConsumableSheet(context),
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.height*1,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 93, 163, 220),
                    
                    
                  ),
                  child: Center(
                    child: Text(
                      'Add Consumable',
                     style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                   ), ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15, right: 15, top: 2
              ),
              child: InkWell(
                onTap: () => AddCompBottomSheet(context),
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.height*1,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 101, 173, 232),
                   
                    
                  ),
                  child: Center(
                    child: Text(
                      'Add Non-Consumables',
                   style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                   ), ),
                    
                  ),
                ),
              ),
            )
          ],
        
        ),
      
    );
  }




}