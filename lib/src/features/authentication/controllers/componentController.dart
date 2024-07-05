import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Componentcontroller extends GetxController {
  RxString Skuid = ''.obs;
  RxString CompName = ''.obs;
  RxString Boxname = ''.obs;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController boxnocontroller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    ever(CompName, (_) {
      namecontroller.text = CompName.value;
    });
    ever(Boxname, (_) {
      boxnocontroller.text = Boxname.value;
    });
  }

  void skuidanalyze(String elem) {
    if (RegExp(r'^MC').hasMatch(elem)) {
      if (RegExp(r'AT-MEGA32').hasMatch(elem)) {
        CompName.value = 'ATMEGA32';
        Boxname.value = 'MC-01';
      } else if (RegExp(r'AT-MEGA8').hasMatch(elem)) {
        CompName.value = 'ATMEGA8-16PU';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'PIC18F14K50').hasMatch(elem)) {
        CompName.value = 'PIC18F14K50';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'PIC18F4520').hasMatch(elem)) {
        CompName.value = 'PIC18F(4520)';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'PIC18F4550').hasMatch(elem)) {
        CompName.value = 'PIC18F(4550)';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'PIC16F877A').hasMatch(elem)) {
        CompName.value = 'PIC16F877A AND DS13020538A5';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'ESP32-DEV').hasMatch(elem)) {
        CompName.value = 'esp32_dev kit_V1_green board';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'RASP-3B').hasMatch(elem)) {
        CompName.value = 'Raspberry Pie 3b';
        Boxname.value = 'MC-01';
      } else if (RegExp(r'RASP-4B').hasMatch(elem)) {
        CompName.value = 'Raspberry Pie 4b';
        Boxname.value = 'MC-01';
      } else if (RegExp(r'RASP-PICO').hasMatch(elem)) {
        CompName.value = 'Raspberry pie pico';
        Boxname.value = 'MC-01';
      } else if (RegExp(r'ARD-UNO').hasMatch(elem)) {
        CompName.value = 'ARDUINO UNO';
        Boxname.value = 'MC-02';
      } else if (RegExp(r'STM-32').hasMatch(elem)) {
        CompName.value = 'STM-32F';
        Boxname.value = 'MC-01';
      } else if (RegExp(r'89E516-RD').hasMatch(elem)) {
        CompName.value = '89E516RD';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'ATMEG-16').hasMatch(elem)) {
        CompName.value = 'ATMEGA16L8PU';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'ATMEL-73424').hasMatch(elem)) {
        CompName.value = 'ATMEL73424C256';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'ATMEL-U7482EB').hasMatch(elem)) {
        CompName.value = 'ATMELU7482EB';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'PIC18F 252').hasMatch(elem)) {
        CompName.value = 'PIC18F252';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'PIC18F 13K50').hasMatch(elem)) {
        CompName.value = 'PIC18F13K50';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'PIC18F 887A').hasMatch(elem)) {
        CompName.value = 'PIC16F887A';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'ARD-NANO').hasMatch(elem)) {
        CompName.value = 'Arduino Nano';
        Boxname.value = 'MC-03';
      } else if (RegExp(r'ESP-NMCU').hasMatch(elem)) {
        CompName.value = 'ESP8266 (NODEMCU)';
        Boxname.value = 'MC-02';
      } else if (RegExp(r'ARD-ENC').hasMatch(elem)) {
        CompName.value = 'Arduino ENC28J60 (Ethernet)';
        Boxname.value = 'CM-03';
      }
    }
  }

  void reset() {
    Skuid.value = '';
    CompName.value = '';
    Boxname.value = '';
    namecontroller.clear();
    boxnocontroller.clear();
  }
}
