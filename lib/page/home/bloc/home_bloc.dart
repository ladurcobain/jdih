import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jdih/helper/api.dart';

class HomeBloc {
  var _data;

  final StreamController<Object> _eventController = StreamController();
  StreamSink get eventSink => _eventController.sink;

  final StreamController _stateController = StreamController();
  StreamSink get _stateSink => _stateController.sink;
  Stream get stateStream => _stateController.stream;

  _mapEventToState(userId) async {
    var url = Uri.parse(ApiService.getHome);
    var response = await http.post(url, body: {});
    var content = json.decode(response.body);

    _data = content;

    _stateSink.add(content);
  }

  HomeBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
