import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Componentcontroller extends GetxController {
  RxString Skuid = ''.obs;
  RxString CompName = ''.obs;

    TextEditingController namecontroller = TextEditingController();

     @override
  void onInit() {
    super.onInit();
    ever(CompName, (_) {
      namecontroller.text = CompName.value;
    });
  }


  void skuidanalyze(String elem) {
    if (RegExp(r'^MC').hasMatch(elem)) {
      if(RegExp(r'ARD').hasMatch(elem))
      {
        if(RegExp(r'ENC').hasMatch(elem))
      {
        CompName.value='Arduino ENC';
      }
      }
     
    }
  }

   void reset() {
    Skuid.value = '';
    CompName.value = '';
    namecontroller.clear();
  }
}
