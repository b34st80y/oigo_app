import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  static final db = Firestore.instance;

  // uid = User ID, aid = Alliance ID
  final FirebaseUser user;

  DatabaseService({this.user});

  CollectionReference usersRef = db.collection("users");
  CollectionReference alliancesRef = db.collection("alliances");

  createUser() {
    DocumentReference documentReference = usersRef.document(user.uid);
    documentReference.setData({"email": user.email});
    documentReference.collection("settings").document("therapist").setData({
      "isTrue" : false
    });
  }

  Future<String> getUserName() async {
    DocumentSnapshot userSnap = await usersRef.document(user.uid).get();
    String name = userSnap.data["name"].toString();
    return name;
  }

  updateUserAlliance(String alliance) {
    usersRef.document(user.uid).updateData({
      "alliance": alliance,
    });
  }

  updateOtherUserAlliance(String alliance, String otherUserID) {
    usersRef.document(otherUserID).updateData({
      "alliance": alliance,
    });
  }

  Future<bool> isTherapist() async {
    DocumentSnapshot documentSnapshot = await usersRef
        .document(user.uid)
        .collection("settings")
        .document("therapist")
        .get();
    bool therapist = documentSnapshot.data["isTrue"];
    return therapist;
  }

  upgradeUser() {
    usersRef
        .document(user.uid)
        .collection("settings")
        .document("therapist")
        .setData({"isTrue": true});
  }

  createAlliance() {
    // create new alliance document
    var docRef = alliancesRef.document();
    docRef.setData({});
    // link new alliance to user
    updateUserAlliance(docRef.documentID);
  }

  Future<String> getAlliance() async {
    DocumentSnapshot userSnap = await usersRef.document(user.uid).get();
    String aid = userSnap.data["alliance"].toString();
    return aid;
  }

  sendAllianceMessage(String message) {
    getAlliance().then((aid) {
      alliancesRef.document(aid).collection("chat").document().setData({
        "sender": user.uid,
        "displayName": user.displayName,
        "message": message,
        "timestamp": Timestamp.now(),
      });
    });
  }

  Stream<QuerySnapshot> allianceChatStream(aid) {
    return alliancesRef
        .document(aid)
        .collection("chat")
        .orderBy('timestamp')
        .snapshots();
  }

  inviteUserByEmail(String email) async {
    Query query = usersRef.where("email", isEqualTo: email);
    QuerySnapshot querySnap = await query.getDocuments();
    DocumentSnapshot docSnap = querySnap.documents[0];
    String uid = docSnap.documentID;

    String allianceCode = await getAlliance();
    print(allianceCode);
    print(uid);
    updateOtherUserAlliance(allianceCode, uid);
  }
}
