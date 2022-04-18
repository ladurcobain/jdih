import 'package:flutter/material.dart';
import 'package:jdih/src/settings/settings_controller.dart';

class CustomAppBar extends StatelessWidget {
  final SettingsController settingsController;
  CustomAppBar({
    Key? key,
    required this.settingsController,
    required this.data,
  }) : super(key: key);

  var data;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.09,
              child: Image.asset(
                'assets/images/logo_jdihn.png',
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.10,
              child: Image.asset(
                'assets/images/logo_jdih.png',
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  settingsController.updateThemeMode(
                      settingsController.themeMode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light);
                },
                icon: Icon(
                  settingsController.themeMode == ThemeMode.light
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                ))
          ],
        ),
      ),
    );
  }
}
