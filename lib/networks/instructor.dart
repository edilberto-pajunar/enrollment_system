import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/instructor.dart';

class InstructorDB extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<Instructor>? instructorStream;

  Stream<Instructor> getInstructor() {
    return db
        .collection("instructor")
        .doc(firebaseAuth.currentUser!.uid)
        .snapshots()
        .map(instructorFromSnapshot);
  }

  Instructor instructorFromSnapshot(DocumentSnapshot snapshot) {
    return Instructor.fromJson(snapshot.data() as Map<String, dynamic>);
  }

  void updateInstructorStream() {
    instructorStream = getInstructor();
    notifyListeners();
  }
}
