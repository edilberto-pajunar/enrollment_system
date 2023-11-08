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
import 'package:web_school/views/widgets/body/wrapper/stream.dart';
import 'package:web_school/views/widgets/buttons/primary.dart';
import 'package:web_school/views/widgets/fields/primary.dart';

@RoutePage()
class InstructorGradeScreen extends StatefulWidget {
  const InstructorGradeScreen({
    required this.isJunior,
    required this.studentData,
    required this.instructor,
    super.key,
  });

  final ApplicationInfo studentData;
  final bool isJunior;
  final Instructor instructor;

  @override
  State<InstructorGradeScreen> createState() => _InstructorGradeScreenState();
}

class _InstructorGradeScreenState extends State<InstructorGradeScreen> {
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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: InstructorDB.formKey,
          child: ModalProgressHUD(
            inAsyncCall: instructorDB.isLoading,
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

                              double totalGrade = subject.grades.fold(0, (sum, grade) => sum + grade.grade!.toInt());
                              gwa = totalGrade / subject.grades.length;
                            }

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

                                          print(subjectFiltered[index].grades.first.grade);

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
                                    // child: Column(
                                    //   children: List.generate(subjectFiltered[index].grades.length, (index) {
                                    //
                                    //     final subjects = subjectFiltered[index].grades;
                                    //
                                    //     return Text("H");
                                    //
                                    //     // return Padding(
                                    //     //   padding: const EdgeInsets.symmetric(vertical: 4.0),
                                    //     //   child: Row(
                                    //     //     children: [
                                    //     //       Expanded(
                                    //     //         child: Text(subjects[index].title!,
                                    //     //           style: theme.textTheme.bodyLarge!.copyWith(
                                    //     //             fontWeight: FontWeight.w700,
                                    //     //           ),
                                    //     //         ),
                                    //     //       ),
                                    //     //       Text("${subjects[index].grade!}"),
                                    //     //
                                    //     //     ],
                                    //     //   ),
                                    //     // );
                                    //   }),
                                    // ),
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

                // return Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text("Name"),
                //           Text("First"),
                //           Text("Second"),
                //           Text("Third"),
                //           Text("Fourth"),
                //         ],
                //       ),
                //       ListView.builder(
                //         physics: const NeverScrollableScrollPhysics(),
                //         shrinkWrap: true,
                //         itemCount: widget.instructor.subject?.length,
                //         itemBuilder: (context, index) {
                //           return Row(
                //             children: [
                //
                //             ],
                //           );
                //
                //
                //       }),
                //     ],
                //   ),
                // );

                // return Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         const SizedBox(height: 24.0),
                //         // TextButton(
                //         //   onPressed: () {
                //         //     // context.pushRoute(InstructorScheduleRoute(
                //         //     //     subjectList: subjectList!,
                //         //     //     applicationInfo: studentData,
                //         //     //   ),
                //         //     // );
                //         //   },
                //         //   child: Text("See ${widget.studentData.studentInfo.name} schedule",
                //         //     style: theme.textTheme.bodySmall!.copyWith(
                //         //       color: ColorTheme.primaryRed,
                //         //     ),
                //         //   ),
                //         // ),
                //         Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //           child: Container(
                //             width: size.width,
                //             padding: const EdgeInsets.all(12.0),
                //             decoration: BoxDecoration(
                //               border: Border.all(
                //                 color: Colors.black,
                //               ),
                //             ),
                //             child: SingleChildScrollView(
                //               scrollDirection: Axis.horizontal,
                //               child: widget.isJunior
                //                   ? DataTable(
                //                       columnSpacing: 20,
                //                       columns: const [
                //                         DataColumn(
                //                           label: SizedBox(
                //                             width: 80,
                //                             child: Text("Name"),
                //                           ),
                //                         ),
                //                         DataColumn(
                //                           label: Text("First"),
                //                         ),
                //                         DataColumn(
                //                           label: Text("Second"),
                //                         ),
                //                         DataColumn(
                //                           label: Text("Third"),
                //                         ),
                //                         DataColumn(
                //                           label: Text("Fourth"),
                //                         ),
                //                       ],
                //                       rows: subjectList!.map((Subject data) {
                //
                //
                //                         return DataRow(
                //                           cells: [
                //                             DataCell(
                //                               Padding(
                //                                 padding: const EdgeInsets.all(8.0),
                //                                 child: SizedBox(
                //                                     width: 100, child: Text(data.name)),
                //                               ),
                //                             ),
                //                             ...data.grades.map((e) {
                //                               return DataCell(
                //                                 Center(
                //                                   child: InkWell(
                //                                     onTap: () {
                //                                       editGrade(data);
                //                                     },
                //                                     child: Text("${e.grade}"),
                //                                   ),
                //                                 ),
                //                               );
                //                             }).toList(),
                //                           ],
                //                         );
                //                       }).toList(),
                //                     )
                //                   : DataTable(
                //                       columnSpacing: 20,
                //                       columns: const [
                //                         DataColumn(
                //                           label: SizedBox(
                //                             width: 80,
                //                             child: Text("Name"),
                //                           ),
                //                         ),
                //                         DataColumn(
                //                           label: Text("Grade"),
                //                         ),
                //                       ],
                //                       rows: subjectList!.map((e) {
                //                         return DataRow(
                //                           cells: [
                //                             DataCell(
                //                               SizedBox(
                //                                   width: MediaQuery.of(context)
                //                                           .size
                //                                           .width *
                //                                       0.6,
                //                                   child: Text(e.name)),
                //                             ),
                //                             DataCell(
                //                               InkWell(
                //                                   onTap: () {
                //                                     editSeniorGrade(e);
                //                                   },
                //                                   child: Text("${e.grades[0].grade}")),
                //                             ),
                //                           ],
                //                         );
                //                       }).toList(),
                //                     ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     );
              }
            ),
          ),
        ),
      ),
    );
  }
}
