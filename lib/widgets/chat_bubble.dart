import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oigo_app/datatypes/message.dart';
import 'package:provider/provider.dart';

class ChatBubbleRight extends StatelessWidget {
  final Message message;

  ChatBubbleRight({this.message});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: user.displayName == null ? Text("") : Text(user.displayName),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Text(message.text),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  offset: Offset(5, 5),
                  color: Colors.black54,
                )
              ],
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
        ),
      ],
    );
  }
}

class ChatBubbleLeft extends StatelessWidget {
  final Message message;

  ChatBubbleLeft({this.message});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              message.displayName == null ? Text("") : Text(message.displayName),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(message.text),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  offset: Offset(5, 5),
                  color: Colors.black54,
                )
              ],
              gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
        ),
      ],
    );
  }
}
