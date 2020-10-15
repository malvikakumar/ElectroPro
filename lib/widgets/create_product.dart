import 'package:flutter/material.dart';

class CreateProduct extends StatefulWidget {
  @override
  CreateProductState createState() => CreateProductState();
}

class CreateProductState extends State<CreateProduct> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController processor = TextEditingController();
  TextEditingController ram = TextEditingController();
  TextEditingController screensize = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController hdcapacity = TextEditingController();
  String type;

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
                obscureText: true,
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
                      type = value == 1 ? "Mobile" : "Laptop";
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
                  controller: screensize,
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
                  controller: hdcapacity,
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
                  onPressed: () {
                    // call create
                    Navigator.pop(context);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
