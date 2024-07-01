import 'package:flutter/material.dart';
import 'package:inventory/src/common_widgets/app_bar.dart';
import 'package:inventory/src/common_widgets/bottom_navigation_bar.dart';
import 'package:inventory/src/features/main_app/add_component/add_component_bottom_pop_up.dart';
import 'package:inventory/src/features/main_app/dashboard/dashboard_screen.dart';
import 'package:inventory/src/features/main_app/menu_screen/menu_Screen.dart';
import 'package:inventory/src/features/main_app/search_screen/search_screen.dart';
import 'package:inventory/src/features/main_app/transactions_screen/transaction_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const List<Widget> _screenOptions = <Widget>[
    Dashboard(),
    SearchScreen(),
    TransactionScreen(),
    MenuScreen()
  ];

  @override
  State<MainScreen> createState() => _DashboardState();
}

class _DashboardState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 2) {
      // Custom action for the middle "Add" button
      AddCompBottomSheet(context);
    } else {
      setState(() {
        _selectedIndex = index >= 2 ? index - 1 : index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: MainScreen._screenOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex >= 2 ? _selectedIndex + 1 : _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
