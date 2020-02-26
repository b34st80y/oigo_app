import 'package:flutter/material.dart';
import 'package:oigo_app/pages/home/AlliancePage.dart';
import 'package:oigo_app/pages/home/EmotionsPage.dart';
import 'package:oigo_app/pages/home/SettingsPage.dart';
import 'package:oigo_app/services/auth.dart';

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
  ];

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OiGO App'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.lock),
              label: Text('Logout'),
              onPressed: () {
                _auth.signOut();
              }),
          FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              })
        ],
      ),
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
              icon: Icon(Icons.people), title: Text('Alliance')),
        ],
      ),
    );
  }
}
