import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oigo_app/services/auth.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    print("rebuilt");
    var user = Provider.of<FirebaseUser>(context);
    return MaterialApp(
        title: 'Account',
        home: Scaffold(
          appBar: AppBar(title: Text('Account')),
          body: Column(
            children: <Widget>[
              Text("Display Name: " + user.displayName),
              RaisedButton(
                child: Text("Change Display Name"),
                onPressed: () async {
                  TextEditingController _textFieldController =
                      TextEditingController();
                  String newName;

                  _displayDialog(BuildContext context) async {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Enter new dislay name'),
                            content: TextField(
                              controller: _textFieldController,
                              decoration:
                                  InputDecoration(hintText: "ex. John Doe"),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: Text('Save'),
                                onPressed: () async {
                                  newName = _textFieldController.text;
                                  await AuthService().updateDisplayName(newName);
                                  setState(() {
                                    user.reload();
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  }
                  await _displayDialog(context);

                },
              ),
              Text("(Changes will not appear until reloading the app)")
            ],
          ),
        ));
  }
}
