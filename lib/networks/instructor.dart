
import 'dart:io' as io;

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/models/student/subject.dart';

class InstructorDB extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  bool isLoading = false;

  void showHUD(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Stream<Instructor>? instructorStream;

  Stream<Instructor> getInstructor(String id) {
    return db
        .collection("instructor")
        .doc(id)
        .snapshots()
        .map(instructorFromSnapshot);
  }

  Instructor instructorFromSnapshot(DocumentSnapshot snapshot) {
    return Instructor.fromJson(snapshot.data() as Map<String, dynamic>);
  }

  void updateInstructorStream(String id) {
    instructorStream = getInstructor(id);
    notifyListeners();
  }

  String? studentId;

  void updateStudentId(String? value) async {
    studentId = value;

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("studentId", studentId!);
    notifyListeners();
  }

  Future<void> getStudentIdLocal() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    studentId = sp.getString("studentId");
    notifyListeners();
  }

  String? instructorId;

  Future<void> getInstructorIdLocal() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    instructorId = sp.getString("instructorId");
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
  io.File? selectFile;
  Uint8List? selectedImageInBytes;
  String? fileName;

  Future<void> addFile(bool imageFrom) async {
    FilePickerResult? fileResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    print(fileResult);

    if (fileResult != null && fileResult.files.isNotEmpty) {
      // selectFile = io.File(fileResult.files.single.path!);
      fileName = fileResult.files.first.name;
      selectedImageInBytes = fileResult.files.first.bytes;

      print(fileName);

      await firebaseStorage.ref("instructor/$fileName").putData(fileResult.files.single.bytes!);
      
      db.collection("instructor").doc(instructorId!).set({
        "profilePic": fileName,
      }, SetOptions(merge: true));
    }
    notifyListeners();
  }



  pickPhotoFromGallery() async {}

  // uploadFileToFireStore() async {
  //   try {
  //     UploadTask uploadTask;
  //
  //     final Reference ref = firebaseStorage.ref().child("instructor").child("/" + selectFile!.path);
  //
  //     // final metadata = SettableMetadata(
  //     //   contentType: 'image/jpeg',
  //     //   customMetadata: {'picked-file-path': selectFile!.path},
  //     // );
  //
  //     if (kIsWeb) {
  //       print(selectedImageInBytes);
  //       uploadTask = ref.putData(selectedImageInBytes!);
  //     } else {
  //       uploadTask = ref.putFile(io.File(selectFile!.path));
  //     }
  //
  //     return Future.value(uploadTask);
  //
  //   } catch (e) {
  //     throw e;
  //
  //   }
  // }

  Future<String> uploadImageandSaveItemInfo() async {
    return "";
  }

  Stream<String>? instructorProfileStream;

  Stream<String> getInstructorProfile() {
    return db.collection("instructor").doc(instructorId).snapshots()
        .map((event) => event["profilePic"]);
  }

  void updateInstructorProfileStream() {
    instructorProfileStream = getInstructorProfile();
    notifyListeners();
  }

}
