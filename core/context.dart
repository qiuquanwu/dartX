import 'dart:io';
import 'dart:convert';

class Context {
  HttpRequest request;
  HttpResponse response;
  List<Map<String, Object>> formdata;
  Context(HttpRequest request) {
    this.request = request;
    this.response = request.response;
  }

  void JSON(Object data) {
    this.response
      ..write(object2json(data))
      ..close();
  }

  String object2json(Object data) {
    String jsonStr = jsonEncode(data);
    return jsonStr;
  }
}
