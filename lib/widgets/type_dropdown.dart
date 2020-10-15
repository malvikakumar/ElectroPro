import 'package:flutter/material.dart';

class TypeDropDown extends StatefulWidget {
  @override
  _TypeDropDownState createState() => _TypeDropDownState();
}

class _TypeDropDownState extends State<TypeDropDown> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          DropdownButton(
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
              setState(
                () {
                  _value = value;
                },
              );
            },
          ),
          // if (_value == 1) ...{
          //   Container(
          //     padding: EdgeInsets.all(10),
          //     child: TextField(
          //       decoration: InputDecoration(
          //         border: OutlineInputBorder(),
          //         labelText: 'Mobile',
          //       ),
          //     ),
          //   )
          // }
        ],
      ),
    );
  }

  Widget getWidgets() {
    if (_value == 1) {
      return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Mobile',
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Laptoop',
          ),
        ),
      );
    }
  }
}
