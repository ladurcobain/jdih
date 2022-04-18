import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jdih/helper/api.dart';

class Bloc {
  // ignore: prefer_typing_uninitialized_variables
  var _data;

  final StreamController<Object> _eventController = StreamController();
  StreamSink get eventSink => _eventController.sink;

  final StreamController _stateController = StreamController();
  StreamSink get _stateSink => _stateController.sink;
  Stream get stateStream => _stateController.stream;

  _mapEventToState(context) async {
    var url = Uri.parse(ApiService.getCompany);
    var response = await http.post(url, body: {});
    var content = json.decode(response.body);

    _data = content;

    _stateSink.add(content);
  }

  Bloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
