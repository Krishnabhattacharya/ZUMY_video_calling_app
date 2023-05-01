import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreMethodes {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<QuerySnapshot<Map<String,dynamic>>> get meethistory => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('meetings')
      .snapshots();
  void addtomeeting(String meetingname) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .add({
        'meetingname': meetingname,
        'time': DateTime.now(),
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
