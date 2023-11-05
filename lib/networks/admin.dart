import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/models/option.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/models/user.dart';
import 'package:web_school/networks/commons.dart';
import 'package:web_school/views/widgets/dialogs/custom.dart';

class AdminDB extends ChangeNotifier {
  bool isLoading = false;
  final CustomDialog customDialog = CustomDialog();

  void showHUD(bool value) {
    isLoading = value;
    notifyListeners();
  }

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String? studentId;

  void updateStudentId(String? value) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("studentId", value!);
    studentId = value;
    notifyListeners();
  }

  Future<void> getStudentIdLocal() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    studentId = sp.getString("studentId");
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
  Future<void> deleteStudent(BuildContext context, {
    required String id,
  }) async {
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
      message: "Are you sure you want to delete?",
    );
  }

  /// update individual student list of
  /// subject stream
  Stream<List<Subject>>? listSubjectStream;

  Stream<List<Subject>> getListSubjectStream() {
    return db
        .collection("student")
        .doc(studentId)
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

  void updateListSubjectStream() {
    listSubjectStream = getListSubjectStream();
    notifyListeners();
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

  void updateStudentSection(BuildContext context, {
    SelectionOption? section,
    required List<Subject> subjectList
  }) {
    studentSection = section;
    updateSection(context, subjectList: subjectList);
    notifyListeners();
  }

  Future<void> updateSection(
    BuildContext context, {
    required List<Subject> subjectList,
  }) async {
    print(studentId);
    await db.collection("student").doc(studentId).set({
      "studentInfo": {
        "section": studentSection?.label,
      }
    }, SetOptions(merge: true)).then((value) {
      subjectList.map((subject) {
        db
            .collection("student")
            .doc(studentId)
            .collection("subjects")
            .doc(subject.id.toString())
            .set({
          "schedule":
              FieldValue.arrayUnion(Commons.grade7SectionA[subject.id].map((e) {
            return e.toJson();
          }).toList())
        }, SetOptions(merge: true));
      }).toList();

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
    subjectOption = [];
    notifyListeners();
  }

  Future<void> addInstructor(BuildContext context) async {
    
    final DateTime now = DateTime.now();

    final String id = Uuid().v1();

     db.collection("instructor").get().then((value) {
      final List<Instructor> instructor = (value.docs).map((doc) {
        final data = doc.data();
        return Instructor.fromJson(data);
      }).toList();


      final UserModel userModel = UserModel(
        controlNumber: username.text.toLowerCase(),
        type: "instructor",
        id: id,
        password: "123456",
      );
      
      if (instructor.isEmpty) {
        final Instructor instructor = Instructor(
          userModel: userModel,
          username: username.text,
          firstName: firstName.text,
          lastName: lastName.text,
          grade: gradeInstructor,
          section: instructorSection,
          strand: strandInstructorOption,
          subject: subjectOption,
          createdAt: Timestamp.fromDate(now),
        );


        db.collection("instructor").doc(id).set(instructor.toJson()).then((value) {

          db.collection("user").doc(id).set(instructor.userModel.toJson());

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added successfully!"),
            ),
          );
          clearInstructorForm();
          context.popRoute();
        });
      } else {
        instructor.forEach((Instructor instructor) {
          if (instructor.userModel.controlNumber != username.text) {

            final Instructor instructor = Instructor(
              userModel: userModel,
              username: username.text,
              firstName: firstName.text,
              lastName: lastName.text,
              grade: gradeInstructor,
              section: instructorSection,
              strand: strandInstructorOption,
              subject: subjectOption,
              createdAt: Timestamp.fromDate(now)
            );

            db.collection("instructor").doc(id).set(instructor.toJson()).then((value) {

              db.collection("user").doc(id).set(instructor.userModel.toJson());

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Added successfully!"),
                ),
              );
              clearInstructorForm();
              context.popRoute();
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Current username is existing",),
                backgroundColor: Colors.red,
              ),
            );
            throw "Username already exists";
          }
        });
      }
    });
  }

  Future<void> editInstructor(BuildContext context, String id) async {

    try {
      
      final DateTime now = DateTime.now();

      final UserModel userModel = UserModel(
        controlNumber: username.text,
        type: "instructor",
        id: id,
        password: "123456",
      );

      final Instructor instructor = Instructor(
        userModel: userModel,
        username: username.text,
        firstName: firstName.text,
        lastName: lastName.text,
        grade: gradeInstructor,
        section: instructorSection,
        strand: strandInstructorOption,
        subject: subjectOption,
        createdAt: Timestamp.fromDate(now),
      );

      db.collection("instructor").doc(instructorId)
          .set(instructor.toJson(),
          SetOptions(merge: true));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Save successfully!"),
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
    if (firstName.text.isNotEmpty
      && lastName.text.isNotEmpty
      && username.text.isNotEmpty
      && instructorSection != null
    ) {
      if (gradeInstructor?.id == 4 || gradeInstructor?.id == 5) {
        return strandInstructorOption != null && subjectOption.isNotEmpty;
      } else {
        return subjectOption.isNotEmpty;
      }
    } else {
      return false;
    }
  }

  void clearInstructorForm() {
    firstName.clear();
    lastName.clear();
    username.clear();
    instructorSection = null;
    gradeInstructor = null;
    strandInstructorOption = null;
    subjectOption = [];
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
    CustomDialog().showAgree(context,
        onTap: () {
          debugPrint("Deleting: $instructorId");
          db.collection("instructor").doc(instructorId).delete().then((value) {
            db.collection("user").doc(instructorId).delete();

            context.popRoute();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Deleted successfully!"),
            ));
          });
        },
      message: "Are you sure you want to delete?",
    );

  }

  SelectionOption? generalYear;

  final List<SelectionOption> generalYearList = [
    const SelectionOption(id: 0, label: "Junior High School"),
    const SelectionOption(id: 1, label: "Senior High School"),
  ];

  bool get juniorYear {
    return generalYear!.id == 0;
  }

  void updateGeneralYear(SelectionOption? value) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("generalYear", jsonEncode(value!.toJson()));
    generalYear = value;
    notifyListeners();
  }

  void updateGeneralYearLocal() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final data = sp.getString("generalYear");
    generalYear ??= SelectionOption.fromJson(jsonDecode(data!));
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

  List<SelectionOption> strandInstructorList = [
    SelectionOption(id: 0, label: "STEM"),
    SelectionOption(id: 1, label: "GAS"),
    SelectionOption(id: 2, label: "HUMMS"),
  ];

  SelectionOption? strandInstructorOption;

  void updateStrandInstructorOption(value) {
    strandInstructorOption = value;
    notifyListeners();
  }

  List<SelectionOption> semesterList = [
    const SelectionOption(id: 0, label: "First"),
    const SelectionOption(id: 1, label: "Second"),
  ];

  SelectionOption? semesterInstructorOption;

  void updateSemesterInstructorOption(value) {
    semesterInstructorOption = value;
    notifyListeners();
  }


  List<Subject> get getSubjectInstructor {
    if (gradeInstructor?.id == 0
        || gradeInstructor?.id == 1
        || gradeInstructor?.id == 2
        || gradeInstructor?.id == 3) {
      return Commons.juniorSubject;
    } else {
      if (strandInstructorOption?.id == 0) {
        if (semesterInstructorOption?.id == 0) {
          return Commons.stemFirstSubjectList;
        } else {
          return Commons.stemSecondSubjectList;
        }
      } else if (strandInstructorOption?.id == 1) {
        if (semesterInstructorOption?.id == 0) {
          return Commons.gasFirstSubjectList;
        } else {
          return Commons.gasSecondSubjectList;
        }
      } else {
        if (semesterInstructorOption?.id == 0) {
          return Commons.hummsFirstSubjectList;
        } else {
          return Commons.hummsSecondSubjectList;
        }
      }
    }
  }

  List<Subject> subjectOption = [];

  void updateSubjectOption(Subject value) {
    if (!subjectOption.contains(value)) {
      subjectOption.add(value);
    } else {
      subjectOption.remove(value);
    }
    notifyListeners();
  }

  Future<void> assignSection(BuildContext context, List<Subject> subjectList) async {
    CustomDialog().assignSection(
      context,
      leftTap: () async {
        updateStudentSection(context,
          subjectList: [],
          section: sectionList[0],
        );
      },
      rightTap: () async {
        updateStudentSection(context,
          subjectList: [],
          section: sectionList[1],
        );
      },
      message: "Assign a section",
      leftText: sectionList[0].label,
      rightText: sectionList[1].label,
    );
  }
}
