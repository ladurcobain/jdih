import 'package:flutter/material.dart';
import 'package:jdih/src/settings/settings_controller.dart';
import 'package:jdih/page/regulation/bloc/regulation_detail_bloc.dart';
import 'package:jdih/page/regulation/model/regulation_detail_model.dart';
import 'package:jdih/page/regulation/widget/detail_regulation.dart';

class RegulationDetailPage extends StatefulWidget {
  final SettingsController settingsController;
  var regulationId;
  RegulationDetailPage(
      {Key? key, required this.regulationId, required this.settingsController})
      : super(key: key);

  @override
  _RegulationDetailPageState createState() => _RegulationDetailPageState();
}

class _RegulationDetailPageState extends State<RegulationDetailPage> {
  RegulationDetailBloc regulationDetailBloc = RegulationDetailBloc();

  @override
  void initState() {
    regulationDetailBloc.eventSink.add(widget.regulationId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: regulationDetailBloc.stateStream,
          builder: (context, snapshot) {
            final dataRegulation = parseRegulationDetail(snapshot.data);
            Result? dataResult =
                snapshot.hasData ? dataRegulation.result : null;

            return Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                DetailRegulation(data: snapshot.hasData ? dataResult : null),
              ],
            );
          },
        ),
      ),
    );
  }
}
