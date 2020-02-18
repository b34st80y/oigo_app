import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(color: Colors.blue[100]),
      child: Text("Settings"),
    );
  }
}