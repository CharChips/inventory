import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/src/features/authentication/screens/HomeScreen.dart';

class Emailcontroller extends GetxController{

 RxString emailget=''.obs;
 RxBool isValidating=false.obs;

final List<String> emails=['adityamhatre2003@gmail.com','sahoocharchit@gmail.com'];

void mailchecker(){

  if(emails.contains(emailget.value)){
    print('email is valid');
    isValidating.value=true;
    Get.to(MainScreen());

  }
  else{
    isValidating.value=false;
  }
}



}