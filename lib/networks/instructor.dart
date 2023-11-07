
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/models/user.dart';

class InstructorDB extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool isLoading = false;

  void showHUD(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Stream<Instructor>? instructorStream;

  Stream<Instructor> getInstructor(UserModel userModel) {
    return db
        .collection("instructor")
        .doc(userModel.id)
        .snapshots()
        .map(instructorFromSnapshot);
  }

  Instructor instructorFromSnapshot(DocumentSnapshot snapshot) {
    return Instructor.fromJson(snapshot.data() as Map<String, dynamic>);
  }

  void updateInstructorStream(UserModel userModel) {
    instructorStream = getInstructor(userModel);
    notifyListeners();
  }

  String? studentId;

  void updateStudentId(String? value) {
    studentId = value;
    notifyListeners();
  }

  Stream<List<Subject>>? subjectListStream;

  Stream<List<Subject>> getSubjectList() {
    return db
        .collection("student")
        .doc(studentId)
        .collection("subjects")
        .snapshots()
        .map(subjectListFromSnapshot);
  }

  List<Subject> subjectListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Subject.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  void updateSubjectListStream() {
    subjectListStream = getSubjectList();
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

  ApplicationInfo studentFromSnapshot(DocumentSnapshot doc) {
    return ApplicationInfo.fromJson(doc.data() as Map<String, dynamic>);
  }

  void updateStudentStream() {
    studentStream = getStudent();
    notifyListeners();
  }

  static GlobalKey<FormState> formKey = GlobalKey();

  static TextEditingController first = TextEditingController();
  static GlobalKey<FormFieldState> firstKey = GlobalKey();

  static TextEditingController second = TextEditingController();
  static GlobalKey<FormFieldState> secondKey = GlobalKey();

  static TextEditingController third = TextEditingController();
  static GlobalKey<FormFieldState> thirdKey = GlobalKey();

  static TextEditingController fourth = TextEditingController();
  static GlobalKey<FormFieldState> fourthKey = GlobalKey();

  void initGradeText({
    required String firstGrade,
    required String secondGrade,
    required String thirdGrade,
    required String fourthGrade,
  }) {
    first.text = firstGrade;
    second.text = secondGrade;
    third.text = thirdGrade;
    fourth.text = fourthGrade;
    notifyListeners();
  }

  void initSeniorGradeText({
    required String grade,
  }) {
    first.text = grade;
    notifyListeners();
  }

  String? subjectId;

  void updateSubjectId(String? value) {
    subjectId = value;
    notifyListeners();
  }

  Future<void> updateGrade(
    BuildContext context, {
    required bool isJunior,
    required List<Grade> currentGradeList,
    required ApplicationInfo applicationInfo,
  }) async {
    final List<Grade> object = isJunior
        ? [
            Grade(
              title: currentGradeList[0].title,
              grade: double.parse(first.text),
            ),
            Grade(
              title: currentGradeList[1].title,
              grade: double.parse(second.text),
            ),
            Grade(
              title: currentGradeList[2].title,
              grade: double.parse(third.text),
            ),
            Grade(
              title: currentGradeList[3].title,
              grade: double.parse(fourth.text),
            ),
          ]
        : [
            Grade(
              title: currentGradeList[0].title,
              grade: double.parse(first.text),
            ),
          ];

    showHUD(true);
    try {
      await db
          .collection("student")
          .doc(applicationInfo.userModel.id)
          .collection("subjects")
          .doc(subjectId)
          .update(
        {
          "grades": FieldValue.arrayRemove(
              currentGradeList.map((e) => e.toJson()).toList()),
        },
      ).then((value) {
        db
            .collection("student")
            .doc(applicationInfo.userModel.id)
            .collection("subjects")
            .doc(subjectId)
            .update(
          {
            "grades":
            FieldValue.arrayUnion(object.map((e) => e.toJson()).toList()),
          },
        );
        showHUD(false);
        context.popRoute();
      });
    } catch (e) {
      showHUD(false);
      context.popRoute();
    }

  }

  void clearGradeForm() {
    first.clear();
    second.clear();
    third.clear();
    fourth.clear();
    notifyListeners();
  }

  bool get validateGrade {
    return first.text.isNotEmpty &&
        second.text.isNotEmpty &&
        third.text.isNotEmpty &&
        fourth.text.isNotEmpty;
  }

  int drawerIndex = 0;

  void updateDrawerIndex(int value) {
    drawerIndex = value;
    notifyListeners();
  }

  Subject? instructorSubjectFilter;

  void updateInstructorSubjectFilter(Subject? subject) {
    instructorSubjectFilter = subject;
    notifyListeners();
  }
  
  // Stream<List<Subject>>? subjectStudentList;
  //
  // Stream<List<ApplicationInfo>> getListSubjectStudent(uid) {
  //   db.collection("student")
  //       .doc(uid)
  //       .collection("subjects")
  //       .snapshots()
  //       .map(_snapshotsFromSubjectStudent);
  // }


}
