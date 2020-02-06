import 'package:flutter/material.dart';
import 'package:oigo_app/Pages/AlliancePage.dart';
import 'package:oigo_app/Pages/EmotionsPage.dart';
import 'package:oigo_app/Pages/SettingsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  int _selectedPage = 0;
  final _pageOptions = [
    EmotionsPage(),
    AlliancePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OiGO App",
      home: Scaffold(
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
              icon: Icon(Icons.face),
              title: Text('Emotions')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.people),
                title: Text('Alliance')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings')
            ),
          ],
        ),
      )
    );
  }
}
