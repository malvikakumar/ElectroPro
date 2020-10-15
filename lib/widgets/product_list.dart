import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Electronic Products';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ProductCard(
              name: 'Product 1',
              description: 'Description of product 1',
            ),
            ProductCard(
              name: 'Product 2',
              description: 'Description of product 2',
            ),
            ProductCard(
              name: 'Product 3',
              description: 'Description of product 3',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/createproduct');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
