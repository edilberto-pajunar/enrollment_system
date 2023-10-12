import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/networks/router/routes.gr.dart';

class InstructorStudentScreen extends StatelessWidget {
  const InstructorStudentScreen({
    required this.studentList,
    required this.instructor,
    super.key,
  });

  final List<ApplicationInfo> studentList;
  final Instructor instructor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // final List<ApplicationInfo> studentGradeList = studentList.map((ApplicationInfo e) {
    //
    //   if (e.schoolInfo.gradeToEnroll.id == instructor.grade?.id
    //       && e.studentInfo.section == instructor.section?.label) {
    //     return e;
    //   }
    // }).toList();

    final List<ApplicationInfo> studentGradeList = studentList.where((e) => e.schoolInfo.gradeToEnroll.id == instructor.grade?.id
        && e.studentInfo.section == instructor.section?.label).toList();


    return Scaffold(
      body: SafeArea(
        child: instructor.subject == null || instructor.subject!.isEmpty
            ? Center(
                child: Text("You are currently not assigned to a class."),
              )
            : Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Please select a subject:"),
                    const SizedBox(height: 4.0),
                    // Wrap(
                    //   children: instructor.subject!.map((Subject subject) {
                    //     return InkWell(
                    //       borderRadius: BorderRadius.circular(12.0),
                    //       onTap: () {
                    //         instructorDB.updateInstructorSubjectFilter(subject);
                    //       },
                    //       child: Container(
                    //         padding: const EdgeInsets.symmetric(
                    //           horizontal: 24.0,
                    //           vertical: 12.0,
                    //         ),
                    //         decoration: BoxDecoration(
                    //           color: instructorDB.instructorSubjectFilter?.id == subject.id
                    //             ? Colors.black
                    //             : Colors.white,
                    //           border: Border.all(
                    //             color: Colors.black,
                    //           ),
                    //           borderRadius: BorderRadius.circular(12.0),
                    //         ),
                    //         child: Text(subject.name,
                    //           style: theme.textTheme.bodyMedium!.copyWith(
                    //             color: instructorDB.instructorSubjectFilter?.id == subject.id
                    //               ? Colors.white
                    //               : Colors.black,
                    //           ),
                    //         ),
                    //       ),
                    //     );
                    //   }).toList(),
                    // ),

                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: studentGradeList.length,
                      itemBuilder: (context, index) {

                        final isJunior = studentGradeList[index].schoolInfo.gradeToEnroll.id == 0
                            || studentGradeList[index].schoolInfo.gradeToEnroll.id == 1
                            || studentGradeList[index].schoolInfo.gradeToEnroll.id == 2
                            || studentGradeList[index].schoolInfo.gradeToEnroll.id == 3;


                        return InkWell(
                          onTap: () {
                            // context.pushRoute(InstructorScheduleRoute(
                            //   applicationInfo: studentList[index],
                            // ));
                            context.pushRoute(
                                InstructorGradeRoute(
                                  isJunior: isJunior,
                                  studentData: studentList[index],
                                  instructor: instructor,
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 12.0,
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${studentGradeList[index].studentInfo.name}",
                                    style: theme.textTheme.bodyLarge!
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${studentGradeList[index].schoolInfo.gradeToEnroll.label}-${studentGradeList[index].studentInfo.section}",
                                  )
                                ],
                              ),
                              const Icon(Icons.arrow_right_alt),
                            ],
                          ),
                      ),
                        );
                    }),
                  ],
                ),
              ),
      ),
    );
  }
}
