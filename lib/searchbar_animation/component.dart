import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatefulWidget {
  final List<String> searchTerms;
  final List<String> scrollTerms;
  final double? width;
  final double? height;
  final TextEditingController controller;
  final VoidCallback pressed;

  const SearchField({
    Key? key,
    required this.searchTerms,
    required this.scrollTerms,
    required this.controller,
    this.width = double.infinity,
    this.height = 60,
    required this.pressed,
  }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  FocusNode focusNode = FocusNode();
  bool showHintText = true;
  int currentIndex = 0;
  Timer? timer;

  void typeWriterEffect(String text) {
    widget.controller.clear();
    timer?.cancel();
    int index = 0;

    timer = Timer.periodic(Duration(milliseconds: 12), (Timer timer) {
      if (index < text.length) {
        widget.controller.text += text[index];
        widget.controller.selection = TextSelection.fromPosition(
            TextPosition(offset: widget.controller.text.length));
        index++;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 2000), (Timer t) {
      setState(() {
        currentIndex = (currentIndex + 1) % widget.scrollTerms.length;
      });
    });

    widget.controller.addListener(() {
      setState(() {
        showHintText = widget.controller.text.isEmpty && !focusNode.hasFocus;
      });
    });

    focusNode.addListener(() {
      setState(() {
        showHintText = widget.controller.text.isEmpty && !focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    widget.controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  List<String> getData(String query) {
    return widget.searchTerms.map((term) => '$term: $query').toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          TypeAheadField<String>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: widget.controller,
              focusNode: focusNode,
              cursorColor: Colors.deepPurple,
              decoration: InputDecoration(
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 22,
                      child: VerticalDivider(
                        width: 1,
                        thickness: 1.2,
                      ),
                    ),
                    IconButton(
                      onPressed: widget.pressed,
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
                hintText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
              ),
              onTap: () {
                setState(() {
                  showHintText = false;
                });
              },
            ),
            suggestionsCallback: (pattern) {
              if (pattern.isEmpty) {
                return [];
              } else {
                return getData(pattern);
              }
            },
            itemBuilder: (context, suggestion) {
              String query = suggestion.split(':').last.trim();
              return ListTile(
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: suggestion.split(':').first + ': ',
                        style: GoogleFonts.openSans(
                            color: Colors.grey, fontSize: 16),
                      ),
                      TextSpan(
                        text: query,
                        style: GoogleFonts.openSans(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            onSuggestionSelected: (suggestion) {
              String searchText = suggestion.split(':').last.trim();
              setState(() {
                widget.controller.text = searchText;
              });
            },
          ),
          Positioned(
            left: 12,
            top: 12,
            child: showHintText
                ? Row(
                    children: [
                      Text(
                        "Search for ",
                        style: GoogleFonts.openSans(
                            color: Colors.grey, fontSize: 16),
                      ),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 100),
                        child: Text(
                          widget.scrollTerms[currentIndex],
                          key: ValueKey<int>(currentIndex),
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
