import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/values/strings/colors.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final StudentDB studentDB =
          Provider.of<StudentDB>(context, listen: false);
      final AdminDB adminDB = Provider.of<AdminDB>(context, listen: false);
      adminDB.getStudentIdLocal().then((_) {
        studentDB.updateListSubjectStream(adminDB.studentId!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final StudentDB studentDB = Provider.of<StudentDB>(context);

    return Scaffold(
      body: Form(
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
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                            ),
                            child: widget.applicationInfo.schoolInfo
                                        .gradeToEnroll.label!
                                        .contains("7") ||
                                    widget.applicationInfo.schoolInfo
                                        .gradeToEnroll.label!
                                        .contains("8") ||
                                    widget.applicationInfo.schoolInfo
                                        .gradeToEnroll.label!
                                        .contains("9") ||
                                    widget.applicationInfo.schoolInfo
                                        .gradeToEnroll.label!
                                        .contains("10")
                                ? DataTable(
                                    columnSpacing: 20,
                                    columns: const [
                                      DataColumn(
                                        label: SizedBox(
                                          width: 80,
                                          child: Text("Name"),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text("First"),
                                      ),
                                      DataColumn(
                                        label: Text("Second"),
                                      ),
                                      DataColumn(
                                        label: Text("Third"),
                                      ),
                                      DataColumn(
                                        label: Text("Fourth"),
                                      ),
                                    ],
                                    rows: subjectList!.map((Subject data) {
                                      return DataRow(
                                        cells: [
                                          DataCell(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                  width: 100,
                                                  child: Text(data.name)),
                                            ),
                                          ),
                                          ...data.grades.map((e) {
                                            return DataCell(
                                              Center(
                                                child: Text("${e.grade}"),
                                              ),
                                            );
                                          }).toList(),
                                        ],
                                      );
                                    }).toList(),
                                  )
                                : DataTable(
                                    columnSpacing: 20,
                                    columns: const [
                                      DataColumn(
                                        label: SizedBox(
                                          width: 80,
                                          child: Text("Name"),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text("Grade"),
                                      ),
                                    ],
                                    rows: subjectList!.map((e) {
                                      return DataRow(
                                        cells: [
                                          DataCell(
                                            SizedBox(
                                                width: 100,
                                                child: Text(e.name)),
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text("${e.grades[0].grade}")),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You are currently not enrolled.",
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      "Please enroll first to see your grades",
                    ),
                    const SizedBox(height: 24.0),
                    InkWell(
                      // onTap: () {
                      //   context.pushRoute(StudentMobileEnrollmentRoute(
                      //     studentInfo: studentData.studentInfo,
                      //   ));
                      // },
                      child: Text(
                        "Click here to enroll ->",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: ColorTheme.primaryRed,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
