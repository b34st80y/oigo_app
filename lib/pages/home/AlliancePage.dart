import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                    return Container(
                      height: 600,
                      child: ListView.builder(
                          itemCount: chatSnapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot messageSnapshot = docs[index];
                            Message message = Message(
                                text: messageSnapshot.data['message'],
                                sender: messageSnapshot.data['sender'],
                                timestamp: messageSnapshot.data['timestamp']);
                            return ChatBubble(message: message);
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
