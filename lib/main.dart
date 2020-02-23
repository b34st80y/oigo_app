import 'package:flutter/material.dart';
import 'package:oigo_app/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OiGO App",
      home: Wrapper(),
    );
  }
}