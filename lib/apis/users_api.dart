import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:muathin/config/config.dart';
import 'package:muathin/models/user.dart';
import 'package:muathin/services/services.dart';

class UsersAPI {
  final CollectionReference _usersCollection = Firestore.instance.collection(Config.users);

  CollectionReference get usersCollection => this._usersCollection;

  Future<DocumentSnapshot> currentUserDocument() async {
    String userID = await Services().auth.currentUserID();
    return this.usersCollection.document(userID).get();
  }

  Future<User> currentUser() async {
    DocumentSnapshot ds = await this.currentUserDocument();
    User u = User().transform(key: ds.documentID, map: ds.data);
    return u;
  }

  Future<DocumentSnapshot> usersRef({String userID}) async {
    return this.usersCollection.document(userID).get();
  }

  Future<User> user(String userID) async {
    DocumentSnapshot ds = await this.usersRef(userID: userID);
    User u = User().transform(key: ds.documentID, map: ds.data);
    return u;
  }
}
