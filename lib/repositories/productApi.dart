import 'dart:async';
import 'dart:convert';

import 'package:currency/models/product.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static const baseUrl = 'http://localhost:8080/api/products';

  static Future getProducts() {
    final productUrl = '$baseUrl';
    return http.get(
      productUrl,
      headers: {'Accept': 'application/json'},
    );
  }

  static Future createProduct(Product product) {
    final productUrl = '$baseUrl';
    var json = product.toJson();
    return http.post(
      productUrl,
      body: jsonEncode(json),
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future updateProduct(Product product) {
    final productUrl = '$baseUrl/${product.id}';
    var json = product.toJson();
    return http.put(
      productUrl,
      body: jsonEncode(json),
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future deleteProduct(int productId) {
    final productUrl = '$baseUrl/$productId';
    return http.delete(productUrl);
  }
}
