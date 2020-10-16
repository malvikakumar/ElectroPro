import 'dart:convert';

import 'package:currency/models/product.dart';
import 'package:currency/repositories/productApi.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  ProductListState createState() => ProductListState();
}

class ProductListState extends State<ProductList> {
  var products = new List<Product>();

  getProducts() async {
    var productList = await ProductApi.getProducts();
    setState(() {
      Iterable list = json.decode(productList.body.toString());
      products = list.map((model) => Product.fromJson(model)).toList();
    });
  }

  initState() {
    super.initState();
    getProducts();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Electronic Products';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Logout"),
            ),
          ],
        ),
        body: ListView(children: [
          for (var product in products)
            Center(
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
                          onPressed: () async {
                            Navigator.pushNamed(context, '/updateproduct', arguments: product).then((value) => getProducts());
                          },
                        ),
                        SizedBox(width: 8),
                        FlatButton(
                          child: Text('Delete'),
                          onPressed: () async {
                            await ProductApi.deleteProduct(product.id);
                            await getProducts();
                          },
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/createproduct').then((value) => getProducts());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
