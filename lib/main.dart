import 'package:ElectroPro/widgets/create_product.dart';
import 'package:flutter/material.dart';
import 'package:ElectroPro/widgets/widgets.dart';

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
