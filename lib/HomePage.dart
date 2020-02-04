import 'package:flutter/material.dart';
import 'package:oigo_app/main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oigo"),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                      Colors.lightBlue,
                      Colors.blueAccent,
                    ])),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 20, 0, 0),
                        child: Material(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50.0)),
                            color: Colors.purpleAccent[700],
                            child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Stack(
                                  children: <Widget>[
                                    // Stroked text as border.
                                    Text(
                                      'OiGO',
                                      style: TextStyle(
                                        fontSize: 40,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 10.0,
                                            color: Colors.black,
                                            offset: Offset(5.0, 5.0),
                                          )
                                        ],
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 6
                                          ..color = Colors.black,
                                      ),
                                    ),
                                    // Solid text as fill.
                                    Text(
                                      'OiGO',
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                            )
                        ),
                      )
                    ],
                  ),
                )),
            CustomListTile(Icons.face, 'Emote', () {
              Navigator.pushNamed(context, '/emotions');
            }),
            CustomListTile(Icons.people, 'Alliance', () {
              Navigator.pushNamed(context, '/alliance');
            }),
            CustomListTile(Icons.settings, 'Settings', () {
              Navigator.pushNamed(context, '/settings');
            }),
          ],
        ),
      ),
    );
  }
}