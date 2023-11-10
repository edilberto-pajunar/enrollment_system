import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/commons.dart';
import 'package:web_school/networks/instructor.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/views/screens/instructor/navigation_bar/navigation_bar.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';
import 'package:web_school/views/widgets/buttons/primary.dart';
import 'package:web_school/views/widgets/fields/primary.dart';

@RoutePage()
class InstructorSeniorGradeScreen extends StatefulWidget {
  const InstructorSeniorGradeScreen({
    required this.isJunior,
    required this.studentData,
    super.key,
  });

  final ApplicationInfo studentData;
  final bool isJunior;

  @override
  State<InstructorSeniorGradeScreen> createState() => _InstructorSeniorGradeScreenState();
}

class _InstructorSeniorGradeScreenState extends State<InstructorSeniorGradeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final StudentDB studentDB = Provider.of<StudentDB>(context, listen: false);
      final AdminDB adminDB = Provider.of<AdminDB>(context, listen: false);
      final InstructorDB instructorDB = Provider.of<InstructorDB>(context, listen: false);
      adminDB.getStudentIdLocal().then((_) {
        studentDB.updateListSubjectStream(adminDB.studentId!);
        adminDB.getInstructorIdLocal().then((_) {
          instructorDB.updateInstructorStream(adminDB.instructorId!);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final InstructorDB instructorDB = Provider.of<InstructorDB>(context);
    final ThemeData theme = Theme.of(context);
    final StudentDB studentDB = Provider.of<StudentDB>(context);

    double gwa = 0;

    void editGrade(Subject data) {
      instructorDB.initGradeText(
        firstGrade: data.grades[0].grade.toString(),
        secondGrade: data.grades[1].grade.toString(),
        thirdGrade: data.grades[2].grade.toString(),
        fourthGrade: data.grades[3].grade.toString(),
      );
      instructorDB.updateSubjectId(data.id.toString());
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              instructorDB.clearGradeForm();
              return true;
            },
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PrimaryTextField(
                      fieldKey: InstructorDB.firstKey,
                      controller: InstructorDB.first,
                      label: "First Grading",
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: Commons.forcedTextValidator,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    void editSeniorGrade(Subject data) {
      instructorDB.initSeniorGradeText(
        grade: data.grades[0].grade.toString(),
      );
      instructorDB.updateSubjectId(data.id.toString());
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              instructorDB.clearGradeForm();
              return true;
            },
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PrimaryTextField(
                      fieldKey: InstructorDB.firstKey,
                      controller: InstructorDB.first,
                      label: "Grade",
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: Commons.forcedTextValidator,
                    ),
                    const SizedBox(height: 24.0),
                    PrimaryButton(
                      onPressed: () {
                        instructorDB.updateGrade(
                          context,
                          isJunior: widget.isJunior,
                          currentGradeList: data.grades,
                          applicationInfo: widget.studentData,
                        );
                      },
                      label: "Submit",
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: InstructorNavigationBar(
          child: Form(
            key: InstructorDB.formKey,
            child: ModalProgressHUD(
              inAsyncCall: instructorDB.isLoading,
              child: StreamWrapper<Instructor>(
                stream: instructorDB.instructorStream,
                child: (instructorData) {
                  return StreamWrapper<List<Subject>>(
                    stream: studentDB.listSubjectStream,
                    child: (subjectList) {

                      return Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${widget.studentData.studentInfo.name}'s grade",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24.0),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: instructorData!.subject!.length,
                                itemBuilder: (context, index) {

                                final List<Subject> subjectFiltered = [];

                                for (Subject subject in subjectList!) {
                                  if (instructorData.subject!.contains(subject)) {
                                    subjectFiltered.add(subject);
                                  }
                                }

                                for (var subject in subjectFiltered) {

                                double totalGrade = subject.grades.fold(0, (sum, grade) => sum + grade.grade!.toInt());
                                  gwa = totalGrade / subject.grades.length;
                                }


                                  return Container(
                                    decoration: BoxDecoration(
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${subjectFiltered[index].name}"),
                                            Text("${subjectFiltered[index].grades.first.grade}"),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.edit,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  );
                                }
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
