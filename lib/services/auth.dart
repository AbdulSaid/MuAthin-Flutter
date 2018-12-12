import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:muathin/apis/apis.dart';
import 'package:muathin/services/crud.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  login({String email, String password, Function onSuccess, Function onFailure(String e)}) {
    this.auth.signInWithEmailAndPassword(email: email, password: password).then((user) {
      onSuccess();
    }, onError: (e) {
      onFailure(e.toString());
      return;
    });
  }

  Future verifyPhoneNumber({String phone, Function onSuccess(String s), Function onFailure(String e)}) async {
    String verificationID;
    await this.auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 5),
        verificationCompleted: (user) {
          onSuccess(verificationID);
        },
        verificationFailed: (error) {
          onFailure(error.toString());
          return;
        },
        codeSent: (String verificationId, [int forceResendingToken]) async {
          verificationID = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationID = verificationId;
        });
  }

  loginWithPhoneNumber({String phone, String smsCode, Function onSuccess(), Function onFailure(String e)}) async {
    this.verifyPhoneNumber(phone: phone, onSuccess: (verificationID) {
      this.auth.signInWithPhoneNumber(verificationId: verificationID, smsCode: smsCode).then((user) {
        onSuccess();
      });
    }, onFailure: (e) {
      onFailure(e);
      return;
    });
  }


  register({Map<String, dynamic> m, String password, Function onSuccess(FirebaseUser u), Function onFailure(String e)}) {
    this.auth.createUserWithEmailAndPassword(email: m['email'], password: password).then((user) async {
      CRUD().create(
          ref: APIs().usersAPI.usersCollection.document(user.uid),
          m: m,
          onSuccess: () {
            onSuccess(user);
          },
          onFailure: (e) {
            onFailure(e);
            return;
          });
    }, onError: (e) {
      onFailure(e.toString());
      return;
    });
  }

  logout({Function onSuccess, Function onFailure(String e)}) async {
    await this.auth.signOut();

    this.isLoggedIn(onSuccess: (u) {
      onFailure(u.uid);
    }, onFailure: () {
      onSuccess();
    });
  }

  Future isLoggedIn({Function onSuccess(FirebaseUser user), Function onFailure}) async {
    FirebaseUser u = await this.auth.currentUser();
    if (u != null) {
      onSuccess(u);
    } else {
      onFailure();
    }
  }

  Future<String> currentUserID() async {
    FirebaseUser u = await this.auth.currentUser();
    return u.uid;
  }

  isEmailVerified({Function onSuccess, Function onFailure}) {
    this.auth.currentUser().then((user) {
      if (user.isEmailVerified) {
        onSuccess();
      } else {
        onFailure();
      }
    });
  }

  resetPassword({String email, Function onSuccess, Function onFailure(String e)}) {
    this.auth.sendPasswordResetEmail(email: email).then((v) {
      onSuccess();
    }, onError: (e) {
      onFailure(e.toString());
      return;
    });
  }
}
