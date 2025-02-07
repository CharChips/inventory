import 'package:inventory/src/data/model.dart';

class Sensors {
  List<Component> components = [
    Component(name: 'IR SENSOR (photo diode)', boxNo: '', stock: 17),
    Component(name: 'Hall effect sensor', boxNo: '', stock: 7),
    Component(name: 'Flex Sensor', boxNo: '', stock: 4),
    Component(name: 'RP-Lidar Sensor', boxNo: '', stock: 2),
    Component(name: 'FTDI', boxNo: 'SN-01', stock: 0),
    Component(name: 'IR SENSOR (photo diode)', boxNo: 'SN-01', stock: 0),
    Component(name: '1D LIDAR', boxNo: 'SN-01', stock: 0),
    Component(name: 'Temperature Sensor', boxNo: 'SN-01', stock: 0),
    Component(name: 'RAIN DROP SENSOR', boxNo: 'SN-01', stock: 0),
    Component(name: 'NTC COMMON', boxNo: 'SN-01', stock: 0),
    Component(name: 'RGB SENSOR', boxNo: 'SN-01', stock: 0),
    Component(name: 'APD-9930 Proximity Sensor', boxNo: 'SN-01', stock: 0),
    Component(
        name: 'DHT11 (Temperature and humidity sensor)',
        boxNo: 'SN-01',
        stock: 0),
  ];
}
