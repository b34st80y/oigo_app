import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oigo_app/datatypes/message.dart';
import 'package:oigo_app/widgets/chat_bubble.dart';
import 'package:oigo_app/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:oigo_app/services/database.dart';

class AlliancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);

    return Container(
      child: Column(
        children: <Widget>[
          Text("Alliance Chat"),
          RaisedButton(
            child: Text("Create New Alliance"),
            onPressed: () {
              DatabaseService(uid: user.uid).createAlliance();
            },
          ),
          RaisedButton(
            child: Text("Join Alliance"),
            onPressed: () async {
              String alliance = "";

              TextEditingController _textFieldController = TextEditingController();

              _displayDialog(BuildContext context) async {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('TextField in Dialog'),
                        content: TextField(
                          controller: _textFieldController,
                          decoration: InputDecoration(hintText: "TextField in Dialog"),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('Join'),
                            onPressed: () {
                              alliance = _textFieldController.text;
                              DatabaseService().updateUserAlliance(alliance);
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
          RaisedButton(
            child: Text("Share Alliance Code"),
            onPressed: () async {
              String alliance = await DatabaseService(uid: user.uid).getAlliance();

              _displayDialog(BuildContext context) async {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Alliance Code'),
                        content: SelectableText(alliance),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('Copy'),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: alliance));
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              }
              _displayDialog(context);

            },
          ),
          RaisedButton(
            child: Text("Send Message"),
            onPressed: () {
              DatabaseService(uid: user.uid)
                  .sendAllianceMessage("Test Message!");
            },
          ),
          FutureBuilder(
            future: DatabaseService(uid: user.uid).getAlliance(),
            builder: (context, AsyncSnapshot<String> stringSnapshot) {
              return StreamBuilder(
                stream: DatabaseService(uid: user.uid)
                    .allianceChatStream(stringSnapshot.data),
                builder: (context, chatSnapshot) {
                  if (chatSnapshot.hasData && chatSnapshot.data != null) {
                    List<DocumentSnapshot> docs = chatSnapshot.data.documents;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: chatSnapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot messageSnapshot = docs[index];
                            Message message = Message(
                                text: messageSnapshot.data['message'],
                                sender: messageSnapshot.data['sender'],
                                timestamp: messageSnapshot.data['timestamp']);
                            if (message.sender == user.uid) {
                              return Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                    flex: 7,
                                  ),
                                  Flexible(
                                    child: ChatBubbleRight(message: message),
                                    flex: 6,
                                  ),
                                ],
                              );
                            } else {
                              return Row(
                                children: <Widget>[
                                  Flexible(
                                    child: ChatBubbleLeft(message: message),
                                    flex: 6,
                                  ),
                                  Flexible(
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                    flex: 7,
                                  ),
                                ],
                              );
                            }
                          }),
                    );
                  } else {
                    return Loading();
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
