import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_try/rakaz_water_air/screen/screen2.dart';

class FirstScreen extends StatelessWidget {
  final List<Item> itemList = [
    Item(name: 'air', id: 'ssssssss'),
    Item(name: 'streetlight', id: 'ssssssss'),
    Item(name: 'water', id: 'ssssssss'),
    Item(name: 'other', id: 'ssssssss'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NextScreen(items: itemList),
              ),
            );
          },
          child: const Text('Go to Next Screen'),
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String id;

  Item({required this.name, required this.id});
}
