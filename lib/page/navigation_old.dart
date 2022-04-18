import 'package:flutter/material.dart';
import 'package:jdih/src/settings/settings_controller.dart';
import 'package:jdih/page/home/home.dart';
import 'package:jdih/page/profile/contact_page.dart';

class NavPage extends StatefulWidget {
  final SettingsController settingsController;
  const NavPage({Key? key, required this.settingsController}) : super(key: key);
  //final SettingsController settingsController;

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  // ignore: prefer_typing_uninitialized_variables
  late var _settingsController;
  // ignore: prefer_typing_uninitialized_variables
  late var _widgetOptions;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _settingsController = widget.settingsController;
    _widgetOptions = [
      HomePage(settingsController: _settingsController),
      const ContactPage(),
      const ContactPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Produk Hukum',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Profil',
            backgroundColor: Colors.grey,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[400],
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
