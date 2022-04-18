import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jdih/src/settings/settings_controller.dart';
import 'package:jdih/helper/api.dart';
import 'package:jdih/page/regulation/regulation_detail.dart';

class RegulationList extends StatefulWidget {
  final SettingsController settingsController;
  const RegulationList({Key? key, required this.settingsController})
      : super(key: key);

  @override
  _RegulationListState createState() => _RegulationListState();
}

class _RegulationListState extends State<RegulationList> {
  String url = ApiService.getRegulation;
  late Future<GetRegulationList> futureRegulationList;

  // ignore: non_constant_identifier_names
  Future<GetRegulationList> fetchRegulationList() async {
    final response = await http.post(Uri.parse(url), body: {"limit": "10"});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return GetRegulationList.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureRegulationList = fetchRegulationList();
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 14,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<GetRegulationList>(
        future: futureRegulationList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.result!.datas!.length,
              itemBuilder: (context, index) {
                final row = snapshot.data!.result!.datas![index];

                return Card(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RegulationDetail(
                              settingsController: widget.settingsController,
                              id: int.parse(row.regulationId!)),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        row.regulationTitle!,
                      ),
                      subtitle: Text(
                        "Nomor " +
                            row.regulationNo! +
                            " Tahun " +
                            row.regulationYear!,
                      ),
                      trailing: const Icon(Icons.more_vert),
                      isThreeLine: true,
                    ),
                  ),
                );
              },
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

class GetRegulationList {
  int? status;
  String? message;
  Result? result;

  GetRegulationList({this.status, this.message, this.result});

  GetRegulationList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  List<Datas>? datas;

  Result({this.datas});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['datas'] != null) {
      datas = <Datas>[];
      json['datas'].forEach((v) {
        datas!.add(Datas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (datas != null) {
      data['datas'] = datas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datas {
  String? regulationId;
  String? regulationSlug;
  String? regulationNo;
  String? regulationYear;
  String? regulationTitle;
  String? regulationSubject;
  String? regulationHeadline;
  String? regulationCondition;
  String? regulationFile;
  String? regulationFileurl;
  String? regulationCategory;
  String? regulationSubcategory;
  String? regulationDownloadcount;
  String? regulationViewcount;

  Datas(
      {this.regulationId,
      this.regulationSlug,
      this.regulationNo,
      this.regulationYear,
      this.regulationTitle,
      this.regulationSubject,
      this.regulationHeadline,
      this.regulationCondition,
      this.regulationFile,
      this.regulationFileurl,
      this.regulationCategory,
      this.regulationSubcategory,
      this.regulationDownloadcount,
      this.regulationViewcount});

  Datas.fromJson(Map<String, dynamic> json) {
    regulationId = json['regulation_id'];
    regulationSlug = json['regulation_slug'];
    regulationNo = json['regulation_no'];
    regulationYear = json['regulation_year'];
    regulationTitle = json['regulation_title'];
    regulationSubject = json['regulation_subject'];
    regulationHeadline = json['regulation_headline'];
    regulationCondition = json['regulation_condition'];
    regulationFile = json['regulation_file'];
    regulationFileurl = json['regulation_fileurl'];
    regulationCategory = json['regulation_category'];
    regulationSubcategory = json['regulation_subcategory'];
    regulationDownloadcount = json['regulation_downloadcount'];
    regulationViewcount = json['regulation_viewcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regulation_id'] = this.regulationId;
    data['regulation_slug'] = this.regulationSlug;
    data['regulation_no'] = this.regulationNo;
    data['regulation_year'] = this.regulationYear;
    data['regulation_title'] = this.regulationTitle;
    data['regulation_subject'] = this.regulationSubject;
    data['regulation_headline'] = this.regulationHeadline;
    data['regulation_condition'] = this.regulationCondition;
    data['regulation_file'] = this.regulationFile;
    data['regulation_fileurl'] = this.regulationFileurl;
    data['regulation_category'] = this.regulationCategory;
    data['regulation_subcategory'] = this.regulationSubcategory;
    data['regulation_downloadcount'] = this.regulationDownloadcount;
    data['regulation_viewcount'] = this.regulationViewcount;
    return data;
  }
}
