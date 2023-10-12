import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/application/student.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/models/user.dart';

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

  Stream<ApplicationInfo> getStudent(UserModel userModel) {
    return db
        .collection("student")
        .doc(userModel.id)
        .snapshots()
        .map(studentFromSnapshot);
  }

  ApplicationInfo studentFromSnapshot(DocumentSnapshot snapshot) {

    final data = snapshot.data() as Map<String, dynamic>;


    return ApplicationInfo.fromJson(data);
  }

  void updateStudentStream(UserModel userModel) {
    studentStream = getStudent(userModel);
    notifyListeners();
  }

  int selectedIndex = 0;

  void updateSelectedIndex(int value) {
    selectedIndex = value;
    notifyListeners();
  }

  static GlobalKey<FormFieldState> changePassFormKey = GlobalKey();

  static TextEditingController oldPassword = TextEditingController();
  static GlobalKey<FormFieldState> oldPasswordKey = GlobalKey();

  static TextEditingController newPassword = TextEditingController();
  static GlobalKey<FormFieldState> newPasswordKey = GlobalKey();

  static TextEditingController confirmPassword = TextEditingController();
  static GlobalKey<FormFieldState> confirmPasswordKey = GlobalKey();

  Future<void> changePassword(
    BuildContext context, {
    required String currentPassword,
  }) async {
    if (currentPassword == oldPassword.text) {
      debugPrint("Changing Password");

      await firebaseAuth.currentUser!.updatePassword(newPassword.text);

      await db.collection("student").doc(firebaseAuth.currentUser!.uid).set({
        "studentInfo": {
          "password": newPassword.text,
        }
      }, SetOptions(merge: true)).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Successful!"),
          ),
        );
        clearPassword();
        context.popRoute();
      });
    } else {
      context.popRoute();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Wrong Password!"),
          backgroundColor: Colors.red,
        ),
      );
      clearPassword();
    }
  }

  void clearPassword() {
    oldPassword.clear();
    newPassword.clear();
    confirmPassword.clear();
    notifyListeners();
  }

  /// update individual student list of
  /// subject stream
  Stream<List<Subject>>? listSubjectStream;

  Stream<List<Subject>> getListSubjectStream(UserModel userModel) {
    return db
        .collection("student")
        .doc(userModel.id)
        .collection("subjects")
        .snapshots()
        .map(listSubjectSnapshot);
  }

  List<Subject> listSubjectSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Subject.fromMap(data);
    }).toList();
  }

  void updateListSubjectStream(UserModel userModel) {
    listSubjectStream = getListSubjectStream(userModel);
    notifyListeners();
  }

  String enrollmentStatus(StudentInfo? studentInfo) {
    if (studentInfo!.enrolled) {
      return "You are Enrolled";
    } else {
      return "You are not Enrolled";
    }
  }

  String? subjectId;

  void updateSubjectId(String? value) {
    subjectId = value;
    notifyListeners();
  }

  Future<void> updateSubjectEnroll({
    required bool isEnrolled,
  }) async {
    await db
        .collection("student")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("subjects")
        .doc(subjectId)
        .update({
      "enrolled": !isEnrolled,
    });
  }

  Future<void> updateEnrollProfile(BuildContext context) async {
    await db.collection("student").doc(firebaseAuth.currentUser!.uid).set({
      "studentInfo": {
        "enrolled": true,
      }
    }, SetOptions(merge: true)).then((value) {
      context.popRoute();
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text(
                "Congratulations! You are now enrolled!",
                textAlign: TextAlign.center,
              ),
            );
          });
    });
    notifyListeners();
  }

  bool validateEnrollment(List<Subject> subjectList) {
    return subjectList.every((element) => element.enrolled);
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print("Title: ${message.notification?.title}");
    print("Body: ${message.notification?.body}");
    print("Payload: ${message.data}");
  }

  Future<void> initNotifications() async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    await firebaseMessaging.requestPermission();
    final String? token = await firebaseMessaging.getToken();
    debugPrint("Token: $token");

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  int studentDrawerIndex = 1;

  void updateStudentDrawerIndex(int value) {
    studentDrawerIndex = value;
    notifyListeners();
  }
}
