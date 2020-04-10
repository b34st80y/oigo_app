import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'About',
        home: Scaffold(
            appBar: AppBar(title: Text('About')),
            body: Center(
              child: Text(
                  'The OiGO app was commissioned by Assistive Communication Technologies ' +
                      'to help provide a communication bridge between the communicationally ' +
                      'impaired and the people around them, their caregivers, ' +
                      'and their therepists.'),
            )));
  }
}
