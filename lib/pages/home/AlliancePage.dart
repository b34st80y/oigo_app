import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                    return Container(
                      height: 300,
                      child: ListView.builder(
                          itemCount: chatSnapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            List<DocumentSnapshot> list =
                                chatSnapshot.data.documents;
                            String message = list[index].data['message'];
                            return Text(message);
                          }),
                    );
                  }
                  return Container(
                    color: Colors.blue,
                    child: Text("loading..."),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
