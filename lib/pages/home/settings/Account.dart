import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Account',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Account')
        ),
      )
    );
  }
}