import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jdih/helper/api.dart';
import 'package:jdih/helper/func.dart';

class OrganizationPage extends StatefulWidget {
  final String title;
  const OrganizationPage({Key? key, required this.title}) : super(key: key);

  @override
  _OrganizationPageState createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  String title = "";
  String url = ApiService.getOrganization;
  late Future<Organization> futureOrganization;

  Future<Organization> fetchOrganization() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Organization.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    title = widget.title;
    futureOrganization = fetchOrganization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<Organization>(
        future: futureOrganization,
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
                      snapshot.data!.result!.organizationTitle.toString(),
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
                    child: Text(
                      regHtmlWithSpace(
                        snapshot.data!.result!.organizationDescription
                            .toString(),
                      ),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          height: 1.2),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.network(
                      snapshot.data!.result!.organizationImg.toString(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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

class Organization {
  int? status;
  String? message;
  Result? result;

  Organization({this.status, this.message, this.result});

  Organization.fromJson(Map<String, dynamic> json) {
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
  String? organizationTitle;
  String? organizationDescription;
  String? organizationImg;
  String? organizationTmb;

  Result(
      {this.organizationTitle,
      this.organizationDescription,
      this.organizationImg,
      this.organizationTmb});

  Result.fromJson(Map<String, dynamic> json) {
    organizationTitle = json['organization_title'];
    organizationDescription = json['organization_description'];
    organizationImg = json['organization_img'];
    organizationTmb = json['organization_tmb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['organization_title'] = organizationTitle;
    data['organization_description'] = organizationDescription;
    data['organization_img'] = organizationImg;
    data['organization_tmb'] = organizationTmb;

    return data;
  }
}
