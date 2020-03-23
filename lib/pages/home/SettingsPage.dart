import 'package:flutter/material.dart';
import 'package:oigo_app/pages/settings/About.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        //physics: BouncingScrollPhysics(),
        children: <Widget>[
          SettingsInkwell(
            text: "Account",
            icon: Icon(Icons.settings),
            onTap: () {

            },
          ),
          SettingsInkwell(
            icon: Icon(Icons.settings),
            text: "Alliance",
            onTap: () {

            },
          ),
          SettingsInkwell(
            icon: Icon(Icons.settings),
            text: "Notifications",
            onTap: () {

            },
          ),
          SettingsInkwell(
            icon: Icon(Icons.settings),
            text: "About",
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => About()));
            }
          ),
          SettingsInkwell(
            icon: Icon(Icons.settings),
            text: "Help",
            onTap: () {

            },
          ),
          SettingsInkwell(
            icon: Icon(Icons.settings),
            text: "Logout",
            onTap: () {

            },
          ),
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
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: .8, color: Colors.grey))),
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
              Text(text,
                style: TextStyle(
                  fontSize: 25,
                ),),
              Flexible(child: Container(alignment: Alignment.centerRight,child: Icon(Icons.arrow_forward_ios))),
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
