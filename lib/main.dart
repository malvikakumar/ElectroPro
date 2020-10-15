import 'package:flutter/material.dart';

import 'widgets/create_product.dart';
import 'widgets/login.dart';
import 'widgets/product_list.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/productlist': (context) => ProductList(),
      '/createproduct': (context) => CreateProduct(),
    },
  ));
}
