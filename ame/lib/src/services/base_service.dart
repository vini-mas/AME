import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseService {
  final String url = 'https://api.ame.com/';
  final String basePath;

  BaseService(this.basePath);

  Future<http.Response> get({String? path, Map<String, String>? headers}) {
    return http.get(Uri.https(url, basePath + (path ?? '')), headers: headers);
  }

  Future<http.Response> post(
      {String? path,
      Map<String, String>? headers,
      Object? body,
      Encoding? encoding}) {
    return http.post(Uri.https(url, basePath + (path ?? '')),
        body: body, headers: headers, encoding: encoding);
  }
}
