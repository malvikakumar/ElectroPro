import 'package:currency/models/product.dart';
import 'package:currency/repositories/productApi.dart';
import 'package:flutter/material.dart';

import 'product_list.dart';

class UpdateProduct extends StatefulWidget {
  // final Product product;

  // const UpdateProduct({this.product}) : super();
  @override
  UpdateProductState createState() => UpdateProductState();
}

class UpdateProductState extends State<UpdateProduct> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController processor = TextEditingController();
  TextEditingController ram = TextEditingController();
  TextEditingController screenSize = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController hdCapacity = TextEditingController();
  String type = "M";

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: name..text = product.title,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Name'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: description..text = product.description,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Mobile"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Laptop"),
                      value: 2,
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                      type = value == 1 ? "M" : "L";
                    });
                  }),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: processor..text = product.processor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Processor',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: ram..text = product.ram,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'RAM',
                ),
              ),
            ),
            if (_value == 1) ...{
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: screenSize..text = product.screenSize,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Screen Size',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: color..text = product.color,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Color',
                  ),
                ),
              )
            } else ...{
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: hdCapacity..text = product.hdCapacity,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'HD Capacity',
                  ),
                ),
              )
            },
            Container(
                height: 70,
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Update'),
                  onPressed: () async {
                    await _updateProduct(product.id);
                    Navigator.pop(context);
                  },
                )),
          ],
        ),
      ),
    );
  }

  _updateProduct(int productId) async {
    Product product = new Product(
      productId,
      this.name.text,
      this.description.text,
      this.type,
      this.processor.text,
      this.ram.text,
      this.screenSize.text,
      this.color.text,
      this.hdCapacity.text,
    );
    await ProductApi.updateProduct(product);
  }
}
