import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/data/model/user_model.dart';

class FirebaseDbServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _collection = "users";

  Future<void> addData(
    UserModel data,
  ) async {
    try {
      await _firestore
          .collection(_collection)
          .add(data as Map<String, dynamic>);
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

  Stream<QuerySnapshot> getData() {
    return _firestore.collection(_collection).snapshots();
  }
}
