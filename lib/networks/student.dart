import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/application/application.dart';

class StudentDB extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool isLoading = false;

  void showHUD(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Stream<List<ApplicationInfo>>? studentListStream;

  Stream<List<ApplicationInfo>> getStudentList() {
    return db.collection("student").snapshots().map(studentListFromSnapshot);
  }

  List<ApplicationInfo> studentListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      final Map<String, dynamic> doc = e.data() as Map<String, dynamic>;

      return ApplicationInfo.fromJson(doc);
    }).toList();
  }

  void updateStudentListStream() {
    studentListStream = getStudentList();
    notifyListeners();
  }

  Stream<ApplicationInfo>? studentStream;

  Stream<ApplicationInfo> getStudent() {
    return db
        .collection("student")
        .doc(firebaseAuth.currentUser!.uid)
        .snapshots()
        .map(studentFromSnapshot);
  }

  ApplicationInfo studentFromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return ApplicationInfo.fromJson(data);
  }

  void updateStudentStream() {
    studentStream = getStudent();
    notifyListeners();
  }

  
  
}
