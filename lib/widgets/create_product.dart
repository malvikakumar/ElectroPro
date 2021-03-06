import 'package:currency/models/product.dart';
import 'package:currency/repositories/productApi.dart';
import 'package:flutter/material.dart';

import 'product_list.dart';

class CreateProduct extends StatefulWidget {
  @override
  CreateProductState createState() => CreateProductState();
}

class CreateProductState extends State<CreateProduct> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: description,
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
                controller: processor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Processor',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: ram,
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
                  controller: screenSize,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Screen Size',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: color,
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
                  controller: hdCapacity,
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
                  child: Text('Create'),
                  onPressed: () async {
                    await _createProduct();
                    Navigator.pop(context);
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ProductList(),
                    //   ),
                    // );
                  },
                )),
          ],
        ),
      ),
    );
  }

  _createProduct() async {
    Product product = Product(
      null,
      this.name.text,
      this.description.text,
      this.type,
      this.processor.text,
      this.ram.text,
      this.screenSize.text,
      this.color.text,
      this.hdCapacity.text,
    );
    await ProductApi.createProduct(product);
  }
}
