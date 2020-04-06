import 'package:firebase_admin/firebase_admin.dart';
import 'package:firebase_admin/src/credential.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oigo_app/services/auth.dart';
import 'package:oigo_app/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    FirebaseAdmin.instance.initializeApp(AppOptions(
        credential: Credentials.applicationDefault(),
        projectId: 'Admin-Project'), "unique_name");
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().authStream,
      child: MaterialApp(
        title: "OiGO App",
        home: Wrapper(),
      ),
    );
  }
}
