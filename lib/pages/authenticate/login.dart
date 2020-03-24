import 'package:flutter/material.dart';
import 'package:oigo_app/services/auth.dart';
import '../../widgets/loading.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;

  LoginPage({this.toggleView});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // TextField values
  String email = '';
  String password = '';

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
                        height: 60,
                      ),
                      SizedBox(
                          width: 100,
                          height: 100,
                          child: Text(
                              'Welcome to OiGO App!') // Image.asset('assets/images/logo.png'),
                          ),
                      SizedBox(
                        height: 80,
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
                                    color: Colors.green,
                                    style: BorderStyle.solid))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6 character or more'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        autofocus: false,
                        obscureText: true,
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
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error =
                                      'Could not sign in with those credentials';
                                });
                              }
                            }
                          },
                          textColor: Colors.white,
                          color: Colors.purple,
                          height: 50,
                          child: Text("LOGIN"),
                        ),
                      ),
                      FlatButton(
                        child: Text("No Account? Register!",
                            style: TextStyle(color: Colors.purpleAccent)),
                        onPressed: () {
                          widget.toggleView();
                        },
                      ),
                      FlatButton(
                        child: Text("Anonymous Sign-In",
                            style: TextStyle(color: Colors.purpleAccent)),
                        onPressed: () async {
                          setState(() => loading = true);
                          dynamic result = await _auth.signInAnon();
                          if (result == null) {
                            print('error signing in');
                            setState(() => loading = false);
                          } else {
                            print('signed in');
                            print(result.uid);
                          }
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
