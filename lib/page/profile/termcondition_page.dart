import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jdih/helper/api.dart';
import 'package:jdih/helper/func.dart';

class TermconditionPage extends StatefulWidget {
  final String title;
  const TermconditionPage({Key? key, required this.title}) : super(key: key);

  @override
  _TermconditionPageState createState() => _TermconditionPageState();
}

class _TermconditionPageState extends State<TermconditionPage> {
  String title = "";
  String url = ApiService.getTermCondition;
  late Future<Termcondition> futureTermcondition;

  Future<Termcondition> fetchTermcondition() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Termcondition.fromJson(jsonDecode(response.body));
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
    futureTermcondition = fetchTermcondition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<Termcondition>(
        future: futureTermcondition,
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
                      snapshot.data!.result!.termconditionTitle.toString(),
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
                        snapshot.data!.result!.termconditionDescription
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

class Termcondition {
  int? status;
  String? message;
  Result? result;

  Termcondition({this.status, this.message, this.result});

  Termcondition.fromJson(Map<String, dynamic> json) {
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
  String? termconditionTitle;
  String? termconditionDescription;

  Result({this.termconditionTitle, this.termconditionDescription});

  Result.fromJson(Map<String, dynamic> json) {
    termconditionTitle = json['termcondition_title'];
    termconditionDescription = json['termcondition_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['termcondition_title'] = termconditionTitle;
    data['termcondition_description'] = termconditionDescription;

    return data;
  }
}
