import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/features/authentication/controllers/componentController.dart';
import 'package:inventory/src/features/authentication/screens/NewEntry.dart';
import 'package:inventory/src/features/authentication/screens/NewEntry.dart';
import 'package:inventory/src/features/authentication/controllers/componentController.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    TextEditingController rollcontroller = TextEditingController();

  final _future = Supabase.instance.client.from('details').select();
  final supabase=Supabase.instance.client;


  void showmodalbottomsheet(){
  
     final componentcontroller = Get.put(Componentcontroller(), permanent: true);
    componentcontroller.reset();

  showModalBottomSheet(
        sheetAnimationStyle: AnimationStyle(
            curve: Curves.bounceInOut, duration: Durations.long4),
        context: context,
        useSafeArea: true,
        constraints: BoxConstraints.expand(),
         isScrollControlled: true,
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 170, 211, 246),
       builder: (BuildContext context) => WillPopScope(
      onWillPop: () async {
        Get.delete<Componentcontroller>();
        return true;
      },
      child: Newentry(),
    ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        actions: [
          IconButton(onPressed: (){
            showmodalbottomsheet();
          }, icon: Icon(Icons.add))
        ],
      ),
      
      body:
      SizedBox()
    );
    
  }
}
