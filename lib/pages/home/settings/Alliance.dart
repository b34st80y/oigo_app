import 'package:flutter/material.dart';

class Alliance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alliance',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Alliance')
        ),
        body: Center(
          child:Text('Set who the caretaker and therapist are for this users alliance.')
        )
      )
    );
  }
}