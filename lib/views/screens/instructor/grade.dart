import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/networks/commons.dart';
import 'package:web_school/networks/instructor.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';
import 'package:web_school/views/widgets/buttons/primary.dart';
import 'package:web_school/views/widgets/fields/primary.dart';

@RoutePage()
class InstructorGradeScreen extends StatefulWidget {
  const InstructorGradeScreen({
    required this.isJunior,
    super.key,
  });

  final bool isJunior;

  @override
  State<InstructorGradeScreen> createState() => _InstructorGradeScreenState();
}

class _InstructorGradeScreenState extends State<InstructorGradeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final InstructorDB instructorDB =
          Provider.of<InstructorDB>(context, listen: false);
      instructorDB.updateSubjectListStream();
    });
  }

  @override
  Widget build(BuildContext context) {
    final InstructorDB instructorDB = Provider.of<InstructorDB>(context);

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
              stream: instructorDB.subjectListStream,
              child: (subjectList) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: widget.isJunior
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
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                            width: 100, child: Text(data.name)),
                                      ),
                                    ),
                                    ...data.grades.map((e) {
                                      return DataCell(
                                        Center(
                                          child: InkWell(
                                            onTap: () {
                                              editGrade(data);
                                            },
                                            child: Text("${e.grade}"),
                                          ),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Text(e.name)),
                                    ),
                                    DataCell(
                                      InkWell(
                                          onTap: () {
                                            editSeniorGrade(e);
                                          },
                                          child: Text("${e.grades[0].grade}")),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
