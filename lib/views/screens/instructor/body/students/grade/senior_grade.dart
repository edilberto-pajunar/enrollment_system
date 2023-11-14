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
    final AdminDB adminDB = Provider.of<AdminDB>(context);

    double gwa = 0;

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
                              Text("${widget.studentData.studentInfo.name} 's grade",
                                style: theme.textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              Divider(
                                color: Colors.black,
                              ),
                              const SizedBox(height: 24.0),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: instructorData!.subject!.length,
                                itemBuilder: (context, index) {

                                final List<Subject> subjectFiltered = [];

                                final TextEditingController controller = TextEditingController();

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
                                            SizedBox(
                                              width: 150,
                                              child: FittedBox(child: Text("${subjectFiltered[index].name}")),
                                            ),
                                            Text("${subjectFiltered[index].grades.first.grade}"),
                                            IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text("Please enter the grade:"),
                                                      content: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          PrimaryTextField(
                                                            controller: controller,
                                                            label: "Grade",
                                                            hintText: "Grade",
                                                          ),
                                                        ],
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            instructorDB.updateSeniorGrade(
                                                              context,
                                                              id: adminDB.studentId!,
                                                              subjectId: subjectList[index].id.toString(),
                                                              grade: controller.text,
                                                            );
                                                          },
                                                          child: Text("Submit"),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            context.popRoute();
                                                            controller.clear();
                                                          },
                                                          child: Text("Cancel"),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
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
