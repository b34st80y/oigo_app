import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  static final db = Firestore.instance;
  // uid = User ID, aid = Alliance ID
  final String uid;

  DatabaseService({this.uid});

  CollectionReference usersRef = db.collection("users");
  CollectionReference alliancesRef = db.collection("alliances");

  createUser(String name) {
    usersRef.document(uid).setData({
      "name" : name,
      "settings" : {},
    });
  }

  updateUserAlliance(String alliance) {
    usersRef.document(uid).updateData({
      "alliance" : alliance,
    });
  }
  
  createAlliance() {
    // create new alliance document
    var docRef = alliancesRef.document();
    docRef.setData({
      "members" : {
        "user_1" : uid,
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
    DocumentSnapshot userSnap = await usersRef.document(uid).get();
    String aid = userSnap.data["alliance"].toString();
    return aid;
  }

  sendAllianceMessage(String message) {
    getAlliance().then((aid){
      alliancesRef.document(aid).collection("chat").document().setData({
        "sender" : uid,
        "message" : message,
        "timestamp" : Timestamp.now(),
      });
    });
  }

  Stream<QuerySnapshot> allianceChatStream(aid){
    return alliancesRef.document(aid).collection("chat").orderBy('timestamp').snapshots();
  }

}