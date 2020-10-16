import 'package:currency/models/product.dart';
import 'package:currency/repositories/productApi.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.network(
                'https://picsum.photos/250?image=9',
              ),
              title: Text('Name: ${product.title}'),
              subtitle: Text('Description: ${product.description}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Edit'),
                  onPressed: () {
                    // ProductApi.updateProduct(this.id, new Product);
                  },
                ),
                SizedBox(width: 8),
                FlatButton(
                  child: Text('Delete'),
                  onPressed: () {
                    ProductApi.deleteProduct(this.product.id);
                    // Navigator.pushNamed(context, 'deleteProduct');
                  },
                ),
                SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
