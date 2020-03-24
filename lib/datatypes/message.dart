import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
String text;
String sender;
Timestamp timestamp;

Message({this.text, this.sender, this.timestamp});

}