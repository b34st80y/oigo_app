import 'package:flutter/material.dart';
import 'package:oigo_app/services/auth.dart';
import 'package:oigo_app/pages/home/settings/Help.dart';
import 'package:oigo_app/pages/home/settings/Notifications.dart';
import 'package:oigo_app/pages/home/settings/Alliance.dart';
import 'package:oigo_app/pages/home/settings/About.dart';

final AuthService _auth = AuthService();

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'), actions: <Widget>[
        FlatButton.icon(
            icon: Icon(Icons.lock),
            label: Text('Logout'),
            onPressed: () {
              _auth.signOut();
            }),
      ]),
      body: ListView(
        //physics: BouncingScrollPhysics(),
        children: <Widget>[
          SettingsInkwell(
            text: "Account",
            icon: Icon(Icons.settings),
            onTap: () {},
          ),
          SettingsInkwell(
            icon: Icon(Icons.settings),
            text: "Alliance",
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Alliance()));
            },
          ),
          SettingsInkwell(
            icon: Icon(Icons.settings),
            text: "Notifications",
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
          ),
          SettingsInkwell(
              icon: Icon(Icons.settings),
              text: "About",
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => About()));
              }),
          SettingsInkwell(
              icon: Icon(Icons.settings),
              text: "Help",
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Help()));
              })
        ],
      ),
    );
  }
}

class SettingsInkwell extends StatelessWidget {
  final String text;
  final Function onTap;
  final Icon icon;

  SettingsInkwell({this.text, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: .8, color: Colors.grey))),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: icon,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Flexible(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_forward_ios))),
            ],
          ),
        ),
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
