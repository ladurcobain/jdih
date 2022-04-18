import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jdih/page/regulation/regulation_detail.dart';
import 'package:jdih/src/theme/theme.dart';
import 'package:jdih/src/settings/settings_controller.dart';
import 'package:jdih/src/settings/settings_view.dart';
//import 'package:jdih/page/launcher/launcher_page.dart';
import 'package:jdih/page/regulation/regulation_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    var strCrtl =
        // ignore: unrelated_type_equality_checks
        settingsController.themeMode == Themes.lightTheme ? false : true;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        // statusBarColor: Colors.transparent,
        statusBarColor: Colors.black38,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  default:
                    //return LauncherPage(settingsController: settingsController);
                    return RegulationList(
                        settingsController: settingsController);
                }
              },
            );
          },
        );
      },
    );
  }
}
