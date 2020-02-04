import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Oigo App',
    home: Home(),
  ));
}

class Home extends StatelessWidget {
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
                    gradient: LinearGradient(colors:  <Color>[
                      Colors.lightBlue,
                      Colors.blueAccent,
                    ]
                    )
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 30, 0, 0),
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          color: Colors.purpleAccent[700],
                          child: Text("OiGO", style: TextStyle(fontSize: 50, color: Colors.white),)
                        ),
                      )
                    ],
                  ),
                )
            ),
            CustomListTile(Icons.face, 'Emote', (){}),
            CustomListTile(Icons.people, 'Alliance', (){}),
            CustomListTile(Icons.settings, 'Settings', (){}),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget{

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
          border: Border(bottom: BorderSide(color: Colors.grey))
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget> [
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text, style: TextStyle(
                        fontSize: 16.0
                      ),),
                    ),
                  ]
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }

}