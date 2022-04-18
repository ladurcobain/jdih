import 'package:flutter/material.dart';
import 'package:jdih/page/home/bloc/home_bloc.dart';
import 'package:jdih/page/home/model/home_model.dart';
import 'package:jdih/src/settings/settings_controller.dart';
import 'package:jdih/page/home/widget/banner_slider.dart';
import 'package:jdih/page/home/widget/custom_app_bar.dart';
import 'package:jdih/page/home/widget/listing_years.dart';
import 'package:jdih/page/home/widget/listing_category.dart';

class HomePage extends StatefulWidget {
  final SettingsController settingsController;
  const HomePage({Key? key, required this.settingsController})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.eventSink.add(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder(
        stream: homeBloc.stateStream,
        builder: (context, snapshot) {
          final dataHome = parseHome(snapshot.data);
          Result? dataResult = snapshot.hasData ? dataHome.result : null;
          List<Sliders>? dataSlider =
              snapshot.hasData ? dataResult!.slider : null;
          List<GroupYear>? dataGroupYear =
              snapshot.hasData ? dataResult!.groupYear : null;
          List<GroupCategory>? dataGroupCategory =
              snapshot.hasData ? dataResult!.groupCategory : null;

          return Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              CustomAppBar(
                  settingsController: widget.settingsController,
                  data: snapshot.hasData ? dataHome : null),
              BannerSlider(data: snapshot.hasData ? dataSlider : null),
              ListingYears(data: snapshot.hasData ? dataGroupYear : null),
              ListingCategory(
                  data: snapshot.hasData ? dataGroupCategory : null),
            ],
          );
        },
      ),
    );
  }
}
