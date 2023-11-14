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
class InstructorJuniorGradeScreen extends StatefulWidget {
  const InstructorJuniorGradeScreen({
    required this.isJunior,
    required this.studentData,
    required this.instructor,
    super.key,
  });

  final ApplicationInfo studentData;
  final bool isJunior;
  final Instructor instructor;

  @override
  State<InstructorJuniorGradeScreen> createState() => _InstructorJuniorGradeScreenState();
}

class _InstructorJuniorGradeScreenState extends State<InstructorJuniorGradeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
                    PrimaryTextField(
                      fieldKey: InstructorDB.secondKey,
                      controller: InstructorDB.second,
                      label: "Second Grading",
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: Commons.forcedTextValidator,
                    ),
                    PrimaryTextField(
                      fieldKey: InstructorDB.thirdKey,
                      controller: InstructorDB.third,
                      label: "Third Grading",
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: Commons.forcedTextValidator,
                    ),
                    PrimaryTextField(
                      fieldKey: InstructorDB.fourthKey,
                      controller: InstructorDB.fourth,
                      label: "Fourth Grading",
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: Commons.forcedTextValidator,
                    ),
                    const SizedBox(height: 24.0),
                    PrimaryButton(
                      isEnabled: instructorDB.validateGrade,
                      onPressed: () {
                        instructorDB.updateGrade(
                          context,
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
          child: ModalProgressHUD(
            inAsyncCall: instructorDB.isLoading,
            child: Form(
              key: InstructorDB.formKey,
              child: StreamWrapper<List<Subject>>(
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
                            itemCount: widget.instructor.subject!.length,
                            itemBuilder: (context, index) {

                              final List<Subject> subjectFiltered = subjectList!.where((element) {

                                final List<Subject> instructorSubject = widget.instructor.subject!.map((e) => e).toList();

                                return instructorSubject.any((data) => data.id == element.id);

                              }).toList();


                              for (var subject in subjectFiltered) {

                                double totalGrade = subject.grades.fold(0, (sum, grade) => sum + grade.grade!);
                                gwa = totalGrade / 4;
                              }

                              subjectFiltered[index].grades.reduce((value, element) {
                                final total = value.grade! + element.grade!;
                                gwa = total / subjectFiltered[index].grades.length;

                                throw "$gwa";
                              });

                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text("${subjectFiltered[index].name} - GWA: $gwa"),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            editGrade(subjectFiltered[index]);
                                          },
                                          icon: Icon(Icons.edit,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    child: Container(
                                      padding: const EdgeInsets.all(12.0),
                                      height: 150,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12.0),
                                          bottomRight: Radius.circular(12.0),
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: List.generate(subjectFiltered[index].grades.length, (indexes) {

                                            final List<Grade> subjects = subjectFiltered[index].grades;

                                            gwa = subjects.fold(0, (previousValue, element) => previousValue + element.grade!.toInt());

                                            return Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(subjects[indexes].title!,
                                                      style: theme.textTheme.bodyLarge!.copyWith(
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                  Text("${subjects[indexes].grade!}"),

                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
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
