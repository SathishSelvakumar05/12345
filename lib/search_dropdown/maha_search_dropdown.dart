import 'package:flutter/material.dart';

import 'custom/maha_dropdown.dart';

class CitySelectionScreen extends StatefulWidget {
  @override
  _CitySelectionScreenState createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {
  final TextEditingController cityController = TextEditingController();
  final List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix'
  ];
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FormFieldDropdown(
              currentItem: selectedCity,
              items: cities,
              width: 330,
              iDataLoading: false, // Set to true if loading data
              chosenValue: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
              labelText: "City",
              isRequiredField: true,
              validator: (value) =>
                  value == null || value.isEmpty ? "City is required" : null,
              controller: cityController,
              onChanged: (value) {
                print("User typed: $value");
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedCity != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Selected City: $selectedCity")),
                  );
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
