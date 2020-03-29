import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oigo_app/pages/home/AlliancePage.dart';
import 'package:oigo_app/pages/home/EmotionsPage.dart';
import 'package:oigo_app/pages/home/SettingsPage.dart';
import 'package:oigo_app/services/database.dart';
import 'package:provider/provider.dart';

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

  final List<String> menuOptions = [
    "Create New Alliance",
    "Join Alliance From Code",
    "Share Alliance Code",
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('OiGO App'),
        actions: <Widget>[
          FlatButton(
              child: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              }),
          PopupMenuButton(
            onSelected: (String choice) async {
              switch (choice) {
                case "Create New Alliance":
                  DatabaseService(user: user).createAlliance();
                  break;
                case "Join Alliance From Code":
                  print('join alliance');
                  TextEditingController _textFieldController =
                      TextEditingController();
                  String alliance;

                  _displayDialog(BuildContext context) async {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Enter alliance code'),
                            content: TextField(
                              controller: _textFieldController,
                              decoration:
                                  InputDecoration(hintText: "Alliance code"),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: Text('Join'),
                                onPressed: () {
                                  alliance = _textFieldController.text;
                                  DatabaseService(user: user)
                                      .updateUserAlliance(alliance);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  }

                  await _displayDialog(context);
                  break;

                case "Share Alliance Code":
                  String alliance =
                      await DatabaseService(user: user).getAlliance();

                  _displayDialog(BuildContext context) async {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Alliance Code'),
                            content: SelectableText(alliance),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: Text('Copy'),
                                onPressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: alliance));
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  }

                  await _displayDialog(context);
                  break;

                default:
                  break;
              }
            },
            itemBuilder: (context) {
              return menuOptions.map((choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
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

