import 'package:flutter/material.dart';
import 'package:new_try/trip_booking/screen/bottom_screens/settings.dart';

import 'bottom_screens/home.dart';
import 'bottom_screens/profile.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen1(),
    ProfileScreen1(),
    SettingsScreen1(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
