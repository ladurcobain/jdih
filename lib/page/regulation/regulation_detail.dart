import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jdih/src/settings/settings_controller.dart';
import 'package:jdih/helper/api.dart';
import 'package:jdih/helper/func.dart';

class RegulationDetail extends StatefulWidget {
  final SettingsController settingsController;
  var id;
  RegulationDetail(
      {Key? key, required this.settingsController, required this.id})
      : super(key: key);

  @override
  _RegulationDetailState createState() => _RegulationDetailState();
}

class _RegulationDetailState extends State<RegulationDetail> {
  var id = 0;
  String url = ApiService.getRegulationDetail;
  late Future<GetRegulationDetail> futureRegulationDetail;

  // ignore: non_constant_identifier_names
  Future<GetRegulationDetail> fetchRegulationDetail(id) async {
    final response = await http.post(Uri.parse(url), body: {"regulation": id});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return GetRegulationDetail.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    id = widget.id;
    futureRegulationDetail = fetchRegulationDetail(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<GetRegulationDetail>(
        future: futureRegulationDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      snapshot.data!.result!.regulationSlug.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationCondition
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Status',
                          ),
                        ),
                        TextField(
                          maxLines: null,
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationTitle
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Judul',
                          ),
                        ),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationNo
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Nomor',
                          ),
                        ),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationYear
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Tahun',
                          ),
                        ),
                        TextField(
                          maxLines: null,
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationCategory
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Kategori',
                          ),
                        ),
                        TextField(
                          maxLines: null,
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationSubcategory
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Sub Kategori',
                          ),
                        ),
                        TextField(
                          maxLines: null,
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationHeadline
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Tajuk Entri Utama',
                          ),
                        ),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationNumber
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Nomor Induk',
                          ),
                        ),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationCode
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Kode Panggil',
                          ),
                        ),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationShort
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Singkatan Jenis Dokumen',
                          ),
                        ),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationSource
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Sumber',
                          ),
                        ),
                        TextField(
                          maxLines: null,
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationSubject
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Subjek',
                          ),
                        ),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationIsbn
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'ISBN',
                          ),
                        ),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationEdition
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Edisi Cetak',
                          ),
                        ),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationDate
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Tanggal Penetapan',
                          ),
                        ),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationPlace
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Tempat Penetapan',
                          ),
                        ),
                        TextField(
                          maxLines: null,
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationVariety
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Bentuk Peraturan',
                          ),
                        ),
                        TextField(
                          maxLines: null,
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationSector
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Bidang Hukum',
                          ),
                        ),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationPublisher
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Penerbit',
                          ),
                        ),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: snapshot.data!.result!.regulationLanguage
                                  .toString()),
                          decoration: const InputDecoration(
                            labelText: 'Bahasa',
                          ),
                        ),
                        TextField(
                          maxLines: null,
                          readOnly: true,
                          controller: TextEditingController(
                              text: regHtmlWithSpace(snapshot
                                  .data!.result!.regulationDescription
                                  .toString())),
                          decoration: const InputDecoration(
                            labelText: 'Deskripsi Fisik',
                          ),
                        ),
                        TextField(
                          maxLines: null,
                          readOnly: true,
                          controller: TextEditingController(
                              text: regHtmlWithSpace(snapshot
                                  .data!.result!.regulationHistory
                                  .toString())),
                          decoration: const InputDecoration(
                            labelText: 'Riwayat Status',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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

class GetRegulationDetail {
  int? status;
  String? message;
  Result? result;

  GetRegulationDetail({status, message, result});

  GetRegulationDetail.fromJson(Map<String, dynamic> json) {
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
  String? regulationId;
  String? regulationSlug;
  String? regulationNo;
  String? regulationTitle;
  String? regulationSubject;
  String? regulationHeadline;
  String? regulationYear;
  String? regulationDate;
  String? regulationNumber;
  String? regulationCode;
  String? regulationShort;
  String? regulationEdition;
  String? regulationPlace;
  String? regulationPublisher;
  String? regulationSource;
  String? regulationIsbn;
  String? regulationVariety;
  String? regulationSector;
  String? regulationLanguage;
  String? regulationDescription;
  String? regulationHistory;
  String? regulationCondition;
  String? regulationFile;
  String? regulationFileurl;
  String? regulationCategory;
  String? regulationSubcategory;
  String? regulationDownloadcount;
  String? regulationViewcount;

  Result(
      {regulationId,
      regulationSlug,
      regulationNo,
      regulationTitle,
      regulationSubject,
      regulationHeadline,
      regulationYear,
      regulationDate,
      regulationNumber,
      regulationCode,
      regulationShort,
      regulationEdition,
      regulationPlace,
      regulationPublisher,
      regulationSource,
      regulationIsbn,
      regulationVariety,
      regulationSector,
      regulationLanguage,
      regulationDescription,
      regulationHistory,
      regulationCondition,
      regulationFile,
      regulationFileurl,
      regulationCategory,
      regulationSubcategory,
      regulationDownloadcount,
      regulationViewcount});

  Result.fromJson(Map<String, dynamic> json) {
    regulationId = json['regulation_id'];
    regulationSlug = json['regulation_slug'];
    regulationNo = json['regulation_no'];
    regulationTitle = json['regulation_title'];
    regulationSubject = json['regulation_subject'];
    regulationHeadline = json['regulation_headline'];
    regulationYear = json['regulation_year'];
    regulationDate = json['regulation_date'];
    regulationNumber = json['regulation_number'];
    regulationCode = json['regulation_code'];
    regulationShort = json['regulation_short'];
    regulationEdition = json['regulation_edition'];
    regulationPlace = json['regulation_place'];
    regulationPublisher = json['regulation_publisher'];
    regulationSource = json['regulation_source'];
    regulationIsbn = json['regulation_isbn'];
    regulationVariety = json['regulation_variety'];
    regulationSector = json['regulation_sector'];
    regulationLanguage = json['regulation_language'];
    regulationDescription = json['regulation_description'];
    regulationHistory = json['regulation_history'];
    regulationCondition = json['regulation_condition'];
    regulationFile = json['regulation_file'];
    regulationFileurl = json['regulation_fileurl'];
    regulationCategory = json['regulation_category'];
    regulationSubcategory = json['regulation_subcategory'];
    regulationDownloadcount = json['regulation_downloadcount'];
    regulationViewcount = json['regulation_viewcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['regulation_id'] = regulationId;
    data['regulation_slug'] = regulationSlug;
    data['regulation_no'] = regulationNo;
    data['regulation_title'] = regulationTitle;
    data['regulation_subject'] = regulationSubject;
    data['regulation_headline'] = regulationHeadline;
    data['regulation_year'] = regulationYear;
    data['regulation_date'] = regulationDate;
    data['regulation_number'] = regulationNumber;
    data['regulation_code'] = regulationCode;
    data['regulation_short'] = regulationShort;
    data['regulation_edition'] = regulationEdition;
    data['regulation_place'] = regulationPlace;
    data['regulation_publisher'] = regulationPublisher;
    data['regulation_source'] = regulationSource;
    data['regulation_isbn'] = regulationIsbn;
    data['regulation_variety'] = regulationVariety;
    data['regulation_sector'] = regulationSector;
    data['regulation_language'] = regulationLanguage;
    data['regulation_description'] = regulationDescription;
    data['regulation_history'] = regulationHistory;
    data['regulation_condition'] = regulationCondition;
    data['regulation_file'] = regulationFile;
    data['regulation_fileurl'] = regulationFileurl;
    data['regulation_category'] = regulationCategory;
    data['regulation_subcategory'] = regulationSubcategory;
    data['regulation_downloadcount'] = regulationDownloadcount;
    data['regulation_viewcount'] = regulationViewcount;

    return data;
  }
}
