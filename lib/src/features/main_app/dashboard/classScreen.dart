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
import 'package:inventory/src/features/main_app/components_in_class_screen/component_in_class_screen.dart';
import 'package:inventory/src/features/main_app/search_screen/search_screen.dart';
import 'package:inventory/src/features/authentication/controllers/componentController.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Stock {
  int Stockval;

  Stock({required this.Stockval});
}

class Classscreen extends StatefulWidget {
  const Classscreen({required this.title, super.key});

  final String title;

  @override
  State<Classscreen> createState() => _ClassscreenState();
}

class _ClassscreenState extends State<Classscreen> {
  final ComponentController controller = Get.put(ComponentController());
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    controller.Classcomponents.clear();
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
      case 'Display & Indicators':
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

  Future<int> getStock(String componentName) async {
    final totalitems = await supabase
        .from(widget.title)
        .select('stock')
        .eq('name', componentName);

    final stockItems = totalitems.map((item) => Stock(Stockval: item['stock'])).toList();

    var tot = 0;
    for (var item in stockItems) {
      tot = tot + item.Stockval;
    }

    return tot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.black54),
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Color(0xffC5E3FF),
        title: Text(
          widget.title,
          style: GoogleFonts.lato(color: Colors.black),
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
              itemCount: controller.Classcomponents.length,
              itemBuilder: (context, index) {
                final component = controller.Classcomponents[index];

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(
                      component.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: FutureBuilder<int>(
                      future: getStock(component.name),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text('Box No: ${component.boxNo}\nStock: Loading...');
                        } else if (snapshot.hasError) {
                          return Text('Box No: ${component.boxNo}\nStock: Error');
                        } else {
                          return Text('Box No: ${component.boxNo}\nStock: ${snapshot.data}');
                        }
                      },
                    ),
                    onTap: () {
                      Get.to(() => ComponentInClassScreen(component: component));
                    },
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
