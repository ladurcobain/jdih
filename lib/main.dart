import 'package:flutter/material.dart';
import 'package:jdih/src/settings/settings_controller.dart';
import 'package:jdih/src/settings/settings_service.dart';
import 'package:jdih/src/app.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  runApp(MyApp(settingsController: settingsController));
}
