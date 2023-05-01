import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/constant/snakbar.dart';

class Authmethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;

  Future<bool> googlesigninmeyhod(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleauth =
          await googleSignInAccount?.authentication;

      // ignore: non_constant_identifier_names
      final Credential = GoogleAuthProvider.credential(
        accessToken: googleauth?.accessToken,
        idToken: googleauth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(Credential);

      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'dp': user.photoURL,
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      showsnakbar(context, e.message!);
      res = false;
    }
    return res;
  }

  void signout() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
