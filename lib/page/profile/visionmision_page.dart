import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jdih/helper/api.dart';
import 'package:jdih/helper/func.dart';

class VisionmisionPage extends StatefulWidget {
  final String title;
  const VisionmisionPage({Key? key, required this.title}) : super(key: key);

  @override
  _VisionmisionPageState createState() => _VisionmisionPageState();
}

class _VisionmisionPageState extends State<VisionmisionPage> {
  String title = "";
  String url = ApiService.getVisionMision;
  late Future<Visionmision> futureVisionmision;

  Future<Visionmision> fetchVisionmision() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Visionmision.fromJson(jsonDecode(response.body));
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
    futureVisionmision = fetchVisionmision();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<Visionmision>(
        future: futureVisionmision,
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
                      snapshot.data!.result!.visionmisionTitle.toString(),
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
                        snapshot.data!.result!.visionmisionDescription
                            .toString(),
                      ),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          height: 1.2),
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

class Visionmision {
  int? status;
  String? message;
  Result? result;

  Visionmision({this.status, this.message, this.result});

  Visionmision.fromJson(Map<String, dynamic> json) {
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
  String? visionmisionTitle;
  String? visionmisionDescription;

  Result({this.visionmisionTitle, this.visionmisionDescription});

  Result.fromJson(Map<String, dynamic> json) {
    visionmisionTitle = json['visionmision_title'];
    visionmisionDescription = json['visionmision_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['visionmision_title'] = visionmisionTitle;
    data['visionmision_description'] = visionmisionDescription;

    return data;
  }
}
