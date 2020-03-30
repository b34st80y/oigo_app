import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Help')
        ),
        body: Center(
          child: Text('If there are any issues with the OiGO App make sure to contact us so we can make the necessary changes to enhance your experience.')
        )
      )
    );
  }
}