import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CustomScreen extends StatelessWidget {
  final String text;
  final List<String> deviceIds;

  CustomScreen({required this.text, required this.deviceIds});

  Color getRandomColor() {
    List<Color> colorList = [
      Colors.brown,
      Colors.red,
      Colors.orange,
      Colors.black87,
      Colors.purple,
    ];

    Random random = Random();
    return colorList[random.nextInt(colorList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: getRandomColor(),
                child: Text(
                  text[0].toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          ExpansionTile(
              //  backgroundColor: Colors.red,
              shape: Border(),
              title: Text('Device ID'),
              children: deviceIds.asMap().entries.map((entry) {
                int index = entry.key + 1;
                String deviceId = entry.value;
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('ID $index: $deviceId'),
                  ),
                );
              }).toList()),
        ],
      ),
    );
  }
}
