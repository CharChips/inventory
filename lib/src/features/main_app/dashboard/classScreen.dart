import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Component {
  final String name;
  final String boxNo;
  final int stock;

  Component({required this.name, required this.boxNo, required this.stock});
}

class ComponentController extends GetxController {
  RxList<Component> components = <Component>[].obs;

  void addComponent(Component component) {
    components.add(component);
  }
}

class Classscreen extends StatefulWidget {
  const Classscreen({required this.title, super.key});

  final String title;

  @override
  State<Classscreen> createState() => _ClassscreenState();
}

class _ClassscreenState extends State<Classscreen> {
  final ComponentController controller = Get.put(ComponentController());

  @override
  void initState() {
    super.initState();
    // Add some sample data for demonstration purposes
    controller
        .addComponent(Component(name: 'ARDUINO UNO', boxNo: 'MC-02', stock: 9));
    controller.addComponent(
        Component(name: 'Raspberry Pie 3b', boxNo: 'MC-01', stock: 8));
    controller.addComponent(
        Component(name: 'Raspberry Pie 4b', boxNo: 'MC-01', stock: 2));
    controller.addComponent(
        Component(name: 'Raspberry pie pico', boxNo: 'MC-01', stock: 3));
    controller.addComponent(
        Component(name: 'Arduino Nano', boxNo: 'MC-02', stock: 3));
    controller.addComponent(Component(
        name: 'esp32_dev kit_V1_green board', boxNo: 'MC-02', stock: 3));
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
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
