import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static const baseUrl = 'https://api.exchangeratesapi.io';
  final http.Client httpClient;

  ProductApi({@required this.httpClient}) : assert(httpClient != null);

  Future getProducts() {
    final productUrl = '$baseUrl/products';
    return this.httpClient.get(productUrl);
  }

  Future createProduct() {
    final productUrl = '$baseUrl/create';
    return this.httpClient.put(productUrl);
  }
}
