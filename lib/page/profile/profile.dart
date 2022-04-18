import 'package:flutter/material.dart';
import 'package:jdih/src/settings/settings_controller.dart';
import 'package:jdih/page/profile/bloc.dart';
import 'package:jdih/page/profile/model.dart';
import 'package:jdih/page/profile/components/logo_company.dart';
import 'package:jdih/page/profile/components/title_company.dart';
import 'package:jdih/page/profile/components/subtitle_company.dart';
import 'package:jdih/page/profile/components/contact_company.dart';
import 'package:jdih/page/profile/components/button_company.dart';

class ProfilePage extends StatefulWidget {
  final SettingsController settingsController;
  const ProfilePage({Key? key, required this.settingsController})
      : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Bloc bloc = Bloc();

  @override
  void initState() {
    bloc.eventSink.add("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder(
        stream: bloc.stateStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = parseData(snapshot.data);
            Result? dataResult = snapshot.hasData ? data.result : null;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    LogoCompany(str: dataResult!.companyImg.toString()),
                    const SizedBox(
                      height: 20,
                    ),
                    TitleCompany(str: dataResult.companyName.toString()),
                    SubTitleCompany(
                        str: dataResult.companyDescription.toString()),
                    const SizedBox(
                      height: 5,
                    ),
                    ContactCompany(dataResult: dataResult),
                    const SizedBox(
                      height: 25,
                    ),
                    const ButtonCompany(),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
