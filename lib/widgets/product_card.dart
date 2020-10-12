import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String description;
  ProductCard({
    this.name,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              // leading: Icon(Icons.album),
              leading: Image.network(
                'https://picsum.photos/250?image=9',
              ),
              title: Text(name),
              subtitle: Text(description),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Edit'),
                  onPressed: () {/* ... */},
                ),
                SizedBox(width: 8),
                FlatButton(
                  child: Text('Delete'),
                  onPressed: () {/* ... */},
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
