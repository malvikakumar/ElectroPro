import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static const baseUrl = 'https://api.exchangeratesapi.io';
  final http.Client httpClient;

  UserApi({@required this.httpClient}) : assert(httpClient != null);

  Future getUser() {
    final productUrl = '$baseUrl/products';
    return this.httpClient.get(productUrl);
  }
}
