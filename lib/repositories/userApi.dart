import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static const baseUrl = 'http://localhost:8080/api/login';
  final http.Client httpClient;

  UserApi({@required this.httpClient}) : assert(httpClient != null);

  static Future getUser(String username, String password) {
    final loginUrl = '$baseUrl';
    var map = new Map<String, dynamic>();
    map['username'] = username;
    map['password'] = password;

    return http.post(loginUrl, headers: {'Accept': 'application/json'}, body: map);
  }
}
