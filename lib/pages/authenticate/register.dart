import 'package:flutter/material.dart';
import 'package:oigo_app/services/auth.dart';

import '../../loading.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;

  RegisterPage({this.toggleView});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // TextField values
  String email = '';
  String password = '';
  String passwordConfirmation = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              // For when keyboard pops up
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Text('Create an Account')
                            // Image.asset('assets/images/logo.png'),
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email address' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        autofocus: false,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Username",
                            hintText: "Username",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.purple,
                                    style: BorderStyle.solid))),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6 character or more'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        autofocus: false,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.purple,
                                    style: BorderStyle.solid))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        validator: (val) => val != password
                            ? 'Password fields do not match'
                            : null,
                        onChanged: (val) {
                          setState(() => passwordConfirmation = val);
                        },
                        autofocus: false,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Retype Password",
                            hintText: "Retype Password",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.purple,
                                    style: BorderStyle.solid))),
                      ),
                      SizedBox(
                        height: 50,
                        child: Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: double.infinity,
                        child: MaterialButton(
                          onPressed: () async {
                            setState(() {
                              error = 'registration currently disabled...';
                            });
//                            if (_formKey.currentState.validate()) {
//                              setState(() => loading = true);
//                              dynamic result =
//                                  await _auth.registerWithEmailAndPassword(
//                                      email, password);
//                              if (result == null) {
//                                setState(() {
//                                  loading = false;
//                                  error = 'Please enter a valid email';
//                                });
//                              }
//                            }
                          },
                          textColor: Colors.white,
                          color: Colors.purple,
                          height: 50,
                          child: Text("REGISTER"),
                        ),
                      ),
                      FlatButton(
                        child: Text("Already have an account? Sign In!",
                            style: TextStyle(color: Colors.purpleAccent)),
                        onPressed: () {
                          widget.toggleView();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
