import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService{
  static final db = Firestore.instance;
  // uid = User ID, aid = Alliance ID
  final FirebaseUser user;

  DatabaseService({this.user});

  CollectionReference usersRef = db.collection("users");
  CollectionReference alliancesRef = db.collection("alliances");

  createUser() {
    usersRef.document(user.uid).setData({
      "settings" : {},
    });
  }

  Future<String> getUserName() async {
    DocumentSnapshot userSnap = await usersRef.document(user.uid).get();
    String name = userSnap.data["name"].toString();
    return name;
  }

  updateUserAlliance(String alliance) {
    usersRef.document(user.uid).updateData({
      "alliance" : alliance,
    });
  }
  
  createAlliance() {
    // create new alliance document
    var docRef = alliancesRef.document();
    docRef.setData({
      "members" : {
        "user_1" : user.uid,
      },
    });
    // link new alliance to user
    updateUserAlliance(docRef.documentID);
  }

  updateAllianceMembers(String uid1, String uid2, String uid3) {
    alliancesRef.document().updateData({
      "members" : {
        "user_1" : uid1,
        "user_2" : uid2,
        "user_3" : uid3,
      }
    });
  }

  Future<String> getAlliance() async {
    DocumentSnapshot userSnap = await usersRef.document(user.uid).get();
    String aid = userSnap.data["alliance"].toString();
    return aid;
  }

  sendAllianceMessage(String message) {
    getAlliance().then((aid){
      alliancesRef.document(aid).collection("chat").document().setData({
        "sender" : user.uid,
        "displayName" : user.displayName,
        "message" : message,
        "timestamp" : Timestamp.now(),
      });
    });
  }

  Stream<QuerySnapshot> allianceChatStream(aid){
    return alliancesRef.document(aid).collection("chat").orderBy('timestamp').snapshots();
  }

}