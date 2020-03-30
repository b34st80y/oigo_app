import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oigo_app/datatypes/message.dart';
import 'package:oigo_app/services/auth.dart';
import 'package:oigo_app/widgets/chat_bubble.dart';
import 'package:oigo_app/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:oigo_app/services/database.dart';

class AlliancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);

    return Scaffold(
      body: Column(
          children: <Widget>[
            FutureBuilder(
              future: DatabaseService(user: user).getAlliance(),
              builder: (context, AsyncSnapshot<String> stringSnapshot) {
                return StreamBuilder(
                  stream: DatabaseService(user: user)
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
                                  displayName:
                                      messageSnapshot.data['displayName'],
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
