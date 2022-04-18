import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jdih/src/settings/settings_controller.dart';
import 'package:jdih/page/navigation.dart';

class LauncherPage extends StatefulWidget {
  final SettingsController settingsController;
  const LauncherPage({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    var _duration = const Duration(seconds: 2);

    return Timer(
      _duration,
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                NavPage(settingsController: widget.settingsController),
          ),
          (route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Image.asset(
          "assets/images/Logo-jdih.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
