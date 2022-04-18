import 'package:flutter/material.dart';
import 'package:jdih/src/settings/settings_controller.dart';
import 'package:jdih/page/regulation/bloc/regulation_bloc.dart';
import 'package:jdih/page/regulation/model/regulation_model.dart';
import 'package:jdih/page/regulation/widget/custom_app_bar.dart';
import 'package:jdih/page/regulation/widget/listing_regulation.dart';

class RegulationPage extends StatefulWidget {
  final SettingsController settingsController;
  const RegulationPage({Key? key, required this.settingsController})
      : super(key: key);

  @override
  _RegulationPageState createState() => _RegulationPageState();
}

class _RegulationPageState extends State<RegulationPage> {
  RegulationBloc regulationBloc = RegulationBloc();

  @override
  void initState() {
    regulationBloc.eventSink.add(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder(
        stream: regulationBloc.stateStream,
        builder: (context, snapshot) {
          final dataRegulation = parseRegulation(snapshot.data);
          Result? dataResult = snapshot.hasData ? dataRegulation.result : null;

          List<Datas>? dataListRegulation =
              snapshot.hasData ? dataResult!.datas : null;

          return Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              CustomAppBar(
                settingsController: widget.settingsController,
              ),
              ListingRegulation(
                  settingsController: widget.settingsController,
                  data: snapshot.hasData ? dataListRegulation : null),
            ],
          );
        },
      ),
    );
  }
}
