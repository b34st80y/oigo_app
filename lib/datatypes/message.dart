import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
String text;
String sender;
String displayName;
Timestamp timestamp;

Message({this.text, this.sender, this.displayName, this.timestamp});

}