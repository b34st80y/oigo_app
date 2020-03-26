import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notifications')
        ),
        body: Center(
          child: Text('Set priority of notifications')
        )
      )
    );
  }
}