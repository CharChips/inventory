import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/data/Actuators&Motors.dart';
import 'package:inventory/src/data/Communication%20Modules.dart';
import 'package:inventory/src/data/DisplaysandIndicators.dart';
import 'package:inventory/src/data/TransistorsandDiodes.dart';
import 'package:inventory/src/data/audiomodules.dart';
import 'package:inventory/src/data/microControllerList.dart';
import 'package:inventory/src/data/model.dart';
import 'package:inventory/src/data/sensors.dart';
// import 'package:inventory/src/features/main_app/component_list_screen/component_list_screen.dart';
import 'package:inventory/src/features/main_app/components_in_class_screen/component_in_class_screen.dart';

class ComponentController extends GetxController {
  RxList<Component> components = <Component>[].obs;
  RxString title = ''.obs;

  void addComponent(Component component) {
    components.add(component);
  }
}

class Classscreen extends StatefulWidget {
  const Classscreen({required this.title, super.key});

  final String title;

  //final List<Map<String,String>> componentList;

  @override
  State<Classscreen> createState() => _ClassscreenState();
}

class _ClassscreenState extends State<Classscreen> {
  final ComponentController controller = Get.put(ComponentController());

  @override
  void initState() {
    super.initState();
    // Add some sample data for demonstration purposes
    controller.components.clear();
    List<Component> componentList = getComponentListbytitle(widget.title);
    for (Component elem in componentList) {
      controller.addComponent(elem);
    }
  }

  List<Component> getComponentListbytitle(String title) {
    switch (title) {
      case 'Microcontroller':
        return Microcontrollers().components;

      case 'Communication Modules':
        return CommunicationModules().components;

      case 'Sensors':
        return Sensors().components;

      case 'Displays & Indicators':
        return Displaysandindicators().components;

      case 'Transistors and Diodes':
        return Transistorsanddiodes().components;

      case 'Actuators and Motors':
        return ActuatorsandMotors().components;

      case 'Audio Modules':
        return Audiomodules().components;

      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC5E3FF),
        title: Text(
          widget.title,
        ),
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Obx(
            () => ListView.builder(
              itemCount: controller.components.length,
              itemBuilder: (context, index) {
                final component = controller.components[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                      title: Text(
                        component.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          'Box No: ${component.boxNo}\nStock: ${component.stock}'),
                      onTap: () {
                        Get.to(
                            () => ComponentInClassScreen(component: component));
                      }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
