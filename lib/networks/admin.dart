import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/instructor.dart';
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

  SelectionOption? instructorSection;

  void updateInstructorSection(SelectionOption? value) {
    instructorSection = value;
    notifyListeners();
  }

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

  static GlobalKey<FormState> addInstructorFormKey = GlobalKey();

  static TextEditingController username = TextEditingController();
  static GlobalKey<FormFieldState> usernameKey = GlobalKey();

  static TextEditingController firstName = TextEditingController();
  static GlobalKey<FormFieldState> firstNameKey = GlobalKey();

  static TextEditingController lastName = TextEditingController();
  static GlobalKey<FormFieldState> lastNameKey = GlobalKey();

  final List<SelectionOption> gradeList = [
    const SelectionOption(id: 0, label: "Grade 7"),
    const SelectionOption(id: 1, label: "Grade 8"),
    const SelectionOption(id: 2, label: "Grade 9"),
    const SelectionOption(id: 3, label: "Grade 10"),
    const SelectionOption(id: 4, label: "Grade 11"),
    const SelectionOption(id: 5, label: "Grade 12"),
  ];

  SelectionOption? gradeInstructor;

  void updateGradeInstructor(SelectionOption? value) {
    gradeInstructor = value;
    notifyListeners();
  }

  Future<void> addInstructor(BuildContext context) async {
    try {
      firebaseAuth
          .createUserWithEmailAndPassword(
            email: "${username.text}@gmail.com",
            password: "123456",
          )
          .then((value) => {
                db.collection("instructor").doc(value.user!.uid).set(
                      Instructor(
                              username: username.text,
                              id: value.user!.uid,
                              firstName: firstName.text,
                              lastName: lastName.text,
                              section: instructorSection,
                              grade: gradeInstructor)
                          .toJson(),
                    ),
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Added succesfully!"),
                  ),
                ),
                clearInstructorForm(),
                context.popRoute(),
              });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error!"),
        ),
      );
    }
  }

  Future<void> editInstructor(BuildContext context) async {
    try {
      db.collection("instructor").doc(instructorId).set(
          Instructor(
                  username: username.text,
                  id: instructorId!,
                  firstName: firstName.text,
                  lastName: lastName.text,
                  section: instructorSection,
                  grade: gradeInstructor)
              .toJson(),
          SetOptions(merge: true));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Save succesfully!"),
        ),
      );
      clearInstructorForm();
      context.popRoute();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error!"),
        ),
      );
    }
  }

  bool get validateAddInstructor {
    return firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        username.text.isNotEmpty &&
        gradeInstructor != null &&
        instructorSection != null;
  }

  void clearInstructorForm() {
    firstName.clear();
    lastName.clear();
    username.clear();
    instructorSection = null;
    gradeInstructor = null;
    notifyListeners();
  }

  Stream<List<Instructor>>? instructorListStream;

  Stream<List<Instructor>> getInstructorList() {
    return db
        .collection("instructor")
        .snapshots()
        .map(instructorListFromSnapshot);
  }

  List<Instructor> instructorListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((data) {
      return Instructor.fromJson(data.data() as Map<String, dynamic>);
    }).toList();
  }

  void updateInstructorListStream() {
    instructorListStream = getInstructorList();
    notifyListeners();
  }

  String? instructorId;

  void updateInstructorId(String? value) {
    instructorId = value;
    notifyListeners();
  }

  Future<void> deleteInstructor(BuildContext context) async {
    CustomDialog().showAgree(context, onTap: () {
      debugPrint("Deleting: $instructorId");
      db.collection("instructor").doc(instructorId).delete().then((value) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Deleted successfully!"),
        ));
        context.popRoute();
      });
    });
  }

  SelectionOption? generalYear;

  final List<SelectionOption> generalYearList = [
    const SelectionOption(id: 0, label: "Junior High School"),
    const SelectionOption(id: 1, label: "Senior High School"),
  ];

  bool get juniorYear {
    return generalYear!.id == 0;
  }

  void updateGeneralYear(SelectionOption? value) {
    generalYear = value;
    notifyListeners();
  }

  SelectionOption? generalGrade;

  final List<SelectionOption> generalJuniorList = [
    const SelectionOption(id: 0, label: "Grade 7"),
    const SelectionOption(id: 1, label: "Grade 8"),
    const SelectionOption(id: 2, label: "Grade 9"),
    const SelectionOption(id: 3, label: "Grade 10"),
  ];

  final List<SelectionOption> generalSeniorList = [
    const SelectionOption(id: 0, label: "Grade 11"),
    const SelectionOption(id: 1, label: "Grade 12"),
  ];

  void updateGeneralGrade(SelectionOption? value) {
    generalGrade = value;
    notifyListeners();
  }

  SelectionOption? generalSection;

  void updateGeneralSection(SelectionOption? value) {
    generalSection = value;
    notifyListeners();
  }

  void updateState() {
    notifyListeners();
  }

  Stream<Instructor>? instructorStream;

  Stream<Instructor> getInstructor() {
    return db
        .collection("instructor")
        .doc(instructorId)
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
