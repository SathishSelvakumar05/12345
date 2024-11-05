import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component.dart';

class Search extends StatelessWidget {
  final List<String> searchTerms = [
    'Id',
    'Customer Name',
    'Search Assigned For',
    'Search Task For',
    'Search Stage For',
  ];

  final List<String> scrollTerms = [
    "'Id'",
    "'Customer Name'",
    "'Project Lead'",
    "'Task'",
    "'Assign Task'",
  ];
  final List<String> searchTerms2 = [
    'No',
    'parent Name',
    'Search parent For',
    'Search parent For',
    'Search parent For',
  ];

  final List<String> scrollTerms2 = [
    "'Number'",
    "'Customer Name'",
    "'Project Lead'",
    "'Task'",
    "'Assign Task'",
  ];
  final List<String> searchTerms3 = [
    'Id',
    'Customer Name',
    'Search Assigned For',
    'Search Task For',
    'Search Stage For',
  ];

  final List<String> scrollTerms3 = [
    "'Id'",
    "'Customer Name'",
    "'Project Lead'",
    "'Task'",
    "'Assign Task'",
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerA = TextEditingController();
    TextEditingController controllerB = TextEditingController();
    TextEditingController controllerC = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchField(
              pressed: () {
                String searchText = controllerA.text.split(':').last.trim();
                print("search: $searchText");
              },
              controller: controllerA,
              searchTerms: searchTerms,
              scrollTerms: scrollTerms,
            ),
            SizedBox(height: 5),
            SearchField(
              pressed: () {
                String searchText = controllerA.text.split(':').last.trim();
                print("search: $searchText");
              },
              controller: controllerB,
              searchTerms: searchTerms,
              scrollTerms: scrollTerms,
            ),
            SizedBox(height: 5),
            SearchField(
              pressed: () {
                print(controllerC.text);
                String searchText = controllerA.text.split(':').last.trim();
                print("search: $searchText");
              },
              controller: controllerC,
              searchTerms: searchTerms,
              scrollTerms: scrollTerms,
            ),
          ],
        ),
      ),
    );
  }
}
