import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BottomExampleTwo extends StatefulWidget {
  @override
  _BottomExampleTwoState createState() => _BottomExampleTwoState();
}

class _BottomExampleTwoState extends State<BottomExampleTwo> {
  final ScrollController _scrollController = ScrollController();
  bool _isBottomButtonsVisible = true;
  Timer? _scrollStopTimer;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    _scrollStopTimer?.cancel();

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isBottomButtonsVisible) {
        setState(() {
          _isBottomButtonsVisible = false;
        });
      }
    }

    _scrollStopTimer = Timer(Duration(milliseconds: 300), () {
      setState(() {
        _isBottomButtonsVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _scrollStopTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll to Hide Buttons"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: 50,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Item $index"),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _isBottomButtonsVisible
          ? Padding(
              padding: const EdgeInsets.all(18.0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                // height: _isBottomButtonsVisible ? 56 : 0,
                child: Wrap(
                  children: [
                    BottomNavigationBar(
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.search), label: 'Search'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.person), label: 'Profile'),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
