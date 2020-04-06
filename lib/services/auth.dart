import 'package:firebase_admin/firebase_admin.dart';
import 'package:firebase_admin/src/credential.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oigo_app/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Auth change user stream
  Stream<FirebaseUser> get authStream {
    return _auth.onAuthStateChanged;
  }

  // Sign In Anonymously
  dynamic signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  dynamic signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  dynamic registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      DatabaseService(user: user).createUser();
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  updateDisplayName(String name) async {
    FirebaseUser user = await _auth.currentUser();
    UserUpdateInfo info = UserUpdateInfo();
    info.displayName = name;
    user.updateProfile(info);
  }

  inviteUserByEmail(String email) async {
    var app = FirebaseAdmin.instance.app();
    var userRecords = await app.auth().getUserByEmail(email);
    String uid = userRecords.uid;
    print(uid);
  }

}
