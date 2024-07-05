import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class ComponentTable extends StatelessWidget {
  final ComponentController controller = Get.put(ComponentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC5E3FF),
        title: Text('Component Inventory'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Box No',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Stock',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: controller.components
                .map(
                  (component) => DataRow(
                    cells: <DataCell>[
                      DataCell(Text(component.name)),
                      DataCell(Text(component.boxNo)),
                      DataCell(Text(component.stock.toString())),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a sample component for demonstration purposes
          controller.addComponent(
              Component(name: 'ARDUINO UNO', boxNo: 'MC-02', stock: 3));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
