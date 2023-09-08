import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/values/strings/colors.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';
import 'package:web_school/views/widgets/buttons/checkbox.dart';
import 'package:web_school/views/widgets/buttons/primary.dart';

@RoutePage()
class StudentMobileEnrollmentScreen extends StatefulWidget {
  const StudentMobileEnrollmentScreen({super.key});

  @override
  State<StudentMobileEnrollmentScreen> createState() =>
      _StudentMobileEnrollmentScreenState();
}

class _StudentMobileEnrollmentScreenState
    extends State<StudentMobileEnrollmentScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final StudentDB studentDB =
          Provider.of<StudentDB>(context, listen: false);
      studentDB.updateListSubjectStream();
    });
  }

  @override
  Widget build(BuildContext context) {
    final StudentDB studentDB = Provider.of<StudentDB>(context);

    final ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Enrollment"),
        ),
        body: StreamWrapper<List<Subject>>(
            stream: studentDB.listSubjectStream,
            child: (subjectList) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: "Enrollment Status: ",
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: studentDB.enrollmentStatus(subjectList!),
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: studentDB
                                          .enrollmentStatus(subjectList)
                                          .contains("not")
                                      ? Colors.red
                                      : ColorTheme.primaryBlack,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DataTable(
                              columns: const [
                                DataColumn(
                                  label: Text("Subject"),
                                ),
                                DataColumn(
                                  label: Text("Enroll"),
                                ),
                              ],
                              rows: subjectList.map((Subject subject) {
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Text(subject.name),
                                    ),
                                    DataCell(
                                      Center(
                                        child: CustomCheckbox(
                                          value: subject.enrolled,
                                          onChanged: (value) {
                                            studentDB.updateSubjectId(
                                                subject.id.toString());
                                            studentDB.updateSubjectEnroll(
                                                isEnrolled: subject.enrolled);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: PrimaryButton(
                                isEnabled:
                                    studentDB.validateEnrollment(subjectList),
                                onPressed: () {},
                                label: "Enroll",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
