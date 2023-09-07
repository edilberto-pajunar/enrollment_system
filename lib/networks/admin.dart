import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/option.dart';
import 'package:web_school/views/widgets/dialogs/custom.dart';

class AdminDB extends ChangeNotifier {
  bool isLoading = false;

  void showHUD(bool value) {
    isLoading = value;
    notifyListeners();
  }

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String? studentId;

  void updateStudentId(String? value) {
    studentId = value;
    notifyListeners();
  }

  Stream<ApplicationInfo>? studentStream;

  Stream<ApplicationInfo> getStudent() {
    return db
        .collection("student")
        .doc(studentId)
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

  bool schoolInfoShow = false;

  void updateSchoolInfoShow() {
    schoolInfoShow = !schoolInfoShow;
    notifyListeners();
  }

  bool personalInfoShow = false;

  void updatePersonalInfoShow() {
    personalInfoShow = !personalInfoShow;
    notifyListeners();
  }

  bool residenceInfoShow = false;

  void updateResidenceInfoShow() {
    residenceInfoShow = !residenceInfoShow;
    notifyListeners();
  }

  bool emergencyInfoShow = false;

  void updateEmergencyInfoShow() {
    emergencyInfoShow = !emergencyInfoShow;
    notifyListeners();
  }

  bool familyInfoShow = false;

  void updateFamilyInfoShow() {
    familyInfoShow = !familyInfoShow;
    notifyListeners();
  }

  /// delete individual student stream
  Future<void> deleteStudent(BuildContext context) async {
    CustomDialog().showAgree(
      context,
      onTap: () async {
        await db.collection("student").doc(studentId).delete().then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Deleted successfully!")),
          );
          context.popRoute();
        });
      },
    );
  }

  SelectionOption? studentSection;

  List<SelectionOption> sectionList = [
    const SelectionOption(id: 0, label: "A"),
    const SelectionOption(id: 1, label: "B"),
  ];

  void updateStudentSection(BuildContext context, SelectionOption? value) {
    studentSection = value;
    updateSection(context);
    notifyListeners();
  }

  Future<void> updateSection(BuildContext context) async {
    await db.collection("student").doc(studentId).set({
      "studentInfo": {
        "section": studentSection?.label,
      }
    }, SetOptions(merge: true)).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Added successfully!")),
      );
      context.popRoute();
    });
  }
}
