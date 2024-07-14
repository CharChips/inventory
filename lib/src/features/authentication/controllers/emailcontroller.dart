import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/src/features/main_app/main_screen/main_screen.dart';

class Emailcontroller extends GetxController{

 RxString emailget=''.obs;
 RxBool isValidating=false.obs;
  RxString Namefrommail=''.obs;


final List<String> emails=['adityamhatre2003@gmail.com','sahoocharchit@gmail.com','2022.kaustubh.natalkar@ves.ac.in','d2021.atishkar.singh@ves.ac.in','kaustubhworlikar1308@gmail.com'];

  final Map<String, String> emailToName = {
    'adityamhatre2003@gmail.com': 'Aditya Mhatre',
    'sahoochrchit@gmail.com': 'Charchit Sahoo',
    '2022.kaustubh.natalkar@ves.ac.in':'Kaustubh Natalkar',
    'd2021.atishkar.singh@ves.ac.in':'Atishkar Singh',
    'kaustubhworlikar1308@gmail.com':'Kaustubh Worlikar'

  };


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