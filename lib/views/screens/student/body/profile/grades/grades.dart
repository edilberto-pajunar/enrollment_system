import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/views/screens/student/body/profile/grades/junior_grade.dart';
import 'package:web_school/views/screens/student/body/profile/grades/no_grades.dart';
import 'package:web_school/views/screens/student/body/profile/grades/senior_grade.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

class StudentWebGradesScreen extends StatefulWidget {
  const StudentWebGradesScreen({
    required this.applicationInfo,
    super.key,
  });

  final ApplicationInfo applicationInfo;

  @override
  State<StudentWebGradesScreen> createState() => _StudentWebGradesScreenState();
}

class _StudentWebGradesScreenState extends State<StudentWebGradesScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final StudentDB studentDB = Provider.of<StudentDB>(context, listen: false);
      final AdminDB adminDB = Provider.of<AdminDB>(context, listen: false);

      adminDB.getStudentIdLocal().then((value) {
        studentDB.updateListSubjectStream(adminDB.studentId!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final StudentDB studentDB = Provider.of<StudentDB>(context);

    return Form(
      child: widget.applicationInfo.studentInfo.enrolled
          ? StreamWrapper<List<Subject>>(
        stream: studentDB.listSubjectStream,
        child: (subjectList) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Grade",
                    style: theme.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Divider(
                    color: Colors.black,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: widget.applicationInfo.schoolInfo.gradeToEnroll.label!.contains("7")
                        || widget.applicationInfo.schoolInfo.gradeToEnroll.label!.contains("8")
                        || widget.applicationInfo.schoolInfo.gradeToEnroll.label!.contains("9")
                        || widget.applicationInfo.schoolInfo.gradeToEnroll.label!.contains("10")
                        ? JuniorGradeScreen(subjectList: subjectList!)
                        : SeniorGradeScreen(subjectList: subjectList!),
                  ),
                ],
              ),
            ),
          );
        },
      )
          : NotEnrolledScreen(),
    );
  }
}
