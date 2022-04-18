import 'package:flutter/material.dart';
import 'package:jdih/page/profile/profile.dart';
import 'package:jdih/src/settings/settings_controller.dart';
import 'package:jdih/page/home/home.dart';
import 'package:jdih/page/regulation/regulation.dart';

class NavPage extends StatefulWidget {
  final SettingsController settingsController;
  const NavPage({Key? key, required this.settingsController}) : super(key: key);

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;

  widgetOptions(setCtrl) {
    switch (_selectedIndex) {
      case 0:
        return HomePage(settingsController: setCtrl);
      case 1:
        return RegulationPage(settingsController: setCtrl);
      case 2:
        return ProfilePage(settingsController: setCtrl);
      default:
        return HomePage(settingsController: setCtrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widgetOptions(widget.settingsController),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Beranda',
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Produk Hukum',
            icon: Icon(Icons.menu_book_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Kontak',
            icon: Icon(Icons.account_box_outlined),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        fixedColor: Colors.green.shade600,
        // selectedItemColor: Color(0xFF6741FF),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
