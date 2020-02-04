import 'package:flutter/material.dart';
import 'package:oigo_app/AlliancePage.dart';
import 'package:oigo_app/EmotionsPage.dart';
import 'package:oigo_app/HomePage.dart';
import 'package:oigo_app/SettingsPage.dart';


void main() {
  runApp(MaterialApp(
    title: 'Oigo App',
    home: HomePage(),
    initialRoute: '/',
    routes: {
      //'/': (context) => HomePage(),
      '/emotions': (context) => EmotionsPage(),
      '/alliance': (context) => AlliancePage(),
      '/settings': (context) => SettingsPage(),
    },
  ));
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: InkWell(
          onTap: () {onTap();},
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ]),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
