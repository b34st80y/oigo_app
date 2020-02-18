import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      //physics: BouncingScrollPhysics(),
      children: <Widget>[
        SettingsInkwell(
          text: "Setting 1",
          icon: Icon(Icons.settings),
          onTap: () {

          },
        ),
        SettingsInkwell(
          icon: Icon(Icons.settings),
          text: "Setting 2",
          onTap: () {

          },
        ),
        SettingsInkwell(
          icon: Icon(Icons.settings),
          text: "Setting 3",
          onTap: () {

          },
        ),
        SettingsInkwell(
          icon: Icon(Icons.settings),
          text: "Setting 4",
          onTap: () {

          },
        ),
      ],
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
