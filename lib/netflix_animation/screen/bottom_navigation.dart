import 'package:flutter/material.dart';

import 'main_screens/home_screen.dart';
import 'main_screens/profilescreen.dart';
import 'main_screens/settings_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        selectedFontSize: 22,
        unselectedFontSize: 15,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.brown,
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
