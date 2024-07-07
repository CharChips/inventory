import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/data/Actuators&Motors.dart';
import 'package:inventory/src/data/Communication%20Modules.dart';
import 'package:inventory/src/data/DisplaysandIndicators.dart';
import 'package:inventory/src/data/TransistorsandDiodes.dart';
import 'package:inventory/src/data/audiomodules.dart';
import 'package:inventory/src/data/microControllerList.dart';
import 'package:inventory/src/data/model.dart';
import 'package:inventory/src/data/sensors.dart';

class ComponentController extends GetxController {
  RxList<Component> components = <Component>[].obs;
  RxList<Component> foundComponents = <Component>[].obs;

  @override
  void onInit() {
    super.onInit();
    foundComponents.value = components;
  }

  void addComponent(Component component) {
    components.add(component);
    foundComponents.add(component);
  }

  void filterComponents(String query) {
    if (query.isEmpty) {
      foundComponents.value = components;
    } else {
      foundComponents.value = components
          .where((component) =>
              component.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ComponentController controller = Get.put(ComponentController());

  @override
  void initState() {
    super.initState();
    controller.components.clear();
    List<Component> componentList = getAllComponents();
    for (Component elem in componentList) {
      controller.addComponent(elem);
    }
  }

  List<Component> getAllComponents() {
    return [
      ...Microcontrollers().components,
      ...CommunicationModules().components,
      ...Sensors().components,
      ...Displaysandindicators().components,
      ...Transistorsanddiodes().components,
      ...ActuatorsandMotors().components,
      ...Audiomodules().components,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => controller.filterComponents(value),
                decoration: const InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.foundComponents.length,
                    itemBuilder: (context, index) {
                      final component = controller.foundComponents[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          title: Text(
                            component.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Box No: ${component.boxNo}\nStock: ${component.stock}',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
