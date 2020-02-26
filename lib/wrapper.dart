import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oigo_app/pages/authenticate/authenticate.dart';
import 'package:oigo_app/pages/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);

    //return Home or Authenticate depending on authentication state
    if (user == null)
      return Authenticate();
    else
      return Home();
  }
}
