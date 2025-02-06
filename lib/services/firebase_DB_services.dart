import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDbServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  final _collection = "users";

  Future<void> addData(
    UserModel data,
  ) async {
    try {
      await _firestore
          .collection(_collection)
          .doc(_auth.currentUser!.uid)
          .set(data.toMap());
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateData(UserModel data, String docId) async {
    try {
      await _firestore
          .collection(_collection)
          .doc(docId)
          .update(data as Map<String, dynamic>);
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteData(String docId) async {
    try {
      await _firestore.collection(_collection).doc(docId).delete();
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }

  Future getUserData() async {
    try {
      final DocumentSnapshot documentSnapshot = await _firestore
          .collection(_collection)
          .doc(_auth.currentUser!.uid)
          .get();
      final data = documentSnapshot.data();
      log(data.toString());
      if (data != null) {
        return UserModel.fromMap(data as Map<String, dynamic>);
      } else {
        log('Document data is null');
        return null;
      }
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }
}
