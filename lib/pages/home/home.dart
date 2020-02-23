import 'package:flutter/material.dart';
import 'package:oigo_app/pages/home/AlliancePage.dart';
import 'package:oigo_app/pages/home/EmotionsPage.dart';
import 'package:oigo_app/pages/home/SettingsPage.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int _selectedPage = 0;
  final _pageOptions = [
    EmotionsPage(),
    AlliancePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OiGO App')),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.face), // Icons.tag_faces
              title: Text('Emotions')),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('Alliance')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings')),
        ],
      ),
    );
  }
}
