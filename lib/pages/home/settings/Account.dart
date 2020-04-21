import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oigo_app/services/auth.dart';
import 'package:oigo_app/services/database.dart';
import 'package:oigo_app/widgets/loading.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
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
                                  await AuthService()
                                      .updateDisplayName(newName);
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
              FutureBuilder(
                future: DatabaseService(user: user).isTherapist(),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Text("Therapist : " + snapshot.data.toString());
                  else
                    return Text("Therapist : ");
                },
              ),
              RaisedButton(
                child: Text('Upgrade to Therapist'),
                onPressed: () {
                  _displayDialog(BuildContext context) async {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return FutureBuilder(
                              future: DatabaseService(user: user).isTherapist(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return !snapshot.data
                                      ? AlertDialog(
                                          title: Text(
                                              'Are you sure you would like to upgrade?'),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            FlatButton(
                                              child: Text('Upgrade'),
                                              onPressed: () async {
                                                DatabaseService(user: user)
                                                    .upgradeUser();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        )
                                      : AlertDialog(
                                          title: Text(
                                              "Your account is already a Therapist account!"),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('OK'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                } else
                                  return Loading();
                              });
                        });
                  }

                  _displayDialog(context);
                },
              ),
              Text("(Changes will not appear until reloading the app)"),
            ],
          ),
        ));
  }
}
