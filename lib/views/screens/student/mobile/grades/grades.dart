import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

class StudentMobileGradeScreen extends StatefulWidget {
  const StudentMobileGradeScreen({
    required this.applicationInfo,
    super.key,
  });

  final ApplicationInfo applicationInfo;

  @override
  State<StudentMobileGradeScreen> createState() =>
      _StudentMobileGradeScreenState();
}

class _StudentMobileGradeScreenState extends State<StudentMobileGradeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final StudentDB studentDB = Provider.of<StudentDB>(context, listen: false);
      studentDB.updateListSubjectStream(widget.applicationInfo.userModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    final StudentDB studentDB = Provider.of<StudentDB>(context);
    final ThemeData theme = Theme.of(context);

    final personal = widget.applicationInfo.studentInfo;

    return Scaffold(
      body: SafeArea(
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
                    Text("Welcome: ${personal.name}",
                      style: theme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 24.0),

                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: subjectList!.length,
                      itemBuilder: (context, index) {
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
                                    child: Text("${subjectList[index].name} - GWA: 90"),
                                  ),
                                  IconButton(
                                    onPressed: () {},
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
                                child: Column(
                                  children: List.generate(subjectList[index].grades.length, (index) {

                                    final subjects = subjectList[index].grades;

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(subjects[index].title!,
                                              style: theme.textTheme.bodyLarge!.copyWith(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Text("${subjects[index].grade!}"),

                                        ],
                                      ),
                                    );
                                  }),
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
    );


    // return SafeArea(
    //   child: Scaffold(
    //     body: Form(
    //       child: widget.applicationInfo.studentInfo.enrolled
    //             ? StreamWrapper<List<Subject>>(
    //                 stream: studentDB.listSubjectStream,
    //                 child: (subjectList) {
    //                   return Padding(
    //                     padding: const EdgeInsets.all(24.0),
    //                     child: SingleChildScrollView(
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.stretch,
    //                         children: [
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               Text(
    //                                 "Welcome, ${personal.firstName} ${personal.lastName}",
    //                                 style: theme.textTheme.titleSmall,
    //                               ),
    //
    //                               // TextButton(
    //                               //   onPressed: () {
    //                               //     context.pushRoute(StudentScheduleRoute(
    //                               //         subjectList: subjectList!,
    //                               //         applicationInfo: studentData,
    //                               //       ),
    //                               //     );
    //                               //   },
    //                               //   child: Text("See my schedule",
    //                               //     style: theme.textTheme.bodySmall!.copyWith(
    //                               //       color: ColorTheme.primaryRed,
    //                               //     ),
    //                               //   ),
    //                               // ),
    //                             ],
    //                           ),
    //                           const SizedBox(height: 24.0),
    //                           Container(
    //                             padding: const EdgeInsets.all(12.0),
    //                             decoration: BoxDecoration(
    //                               border: Border.all(
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                             child: SingleChildScrollView(
    //                               scrollDirection: Axis.horizontal,
    //                               child: widget.applicationInfo.schoolInfo
    //                                           .gradeToEnroll.label!
    //                                           .contains("7") ||
    //                                   widget.applicationInfo.schoolInfo
    //                                           .gradeToEnroll.label!
    //                                           .contains("8") ||
    //                                   widget.applicationInfo.schoolInfo
    //                                           .gradeToEnroll.label!
    //                                           .contains("9") ||
    //                                   widget.applicationInfo.schoolInfo
    //                                           .gradeToEnroll.label!
    //                                           .contains("10")
    //                                   ? DataTable(
    //                                       columnSpacing: 20,
    //                                       columns: const [
    //                                         DataColumn(
    //                                           label: SizedBox(
    //                                             width: 80,
    //                                             child: Text("Name"),
    //                                           ),
    //                                         ),
    //                                         DataColumn(
    //                                           label: Text("First"),
    //                                         ),
    //                                         DataColumn(
    //                                           label: Text("Second"),
    //                                         ),
    //                                         DataColumn(
    //                                           label: Text("Third"),
    //                                         ),
    //                                         DataColumn(
    //                                           label: Text("Fourth"),
    //                                         ),
    //                                       ],
    //                                       rows: subjectList!
    //                                           .map((Subject data) {
    //                                         return DataRow(
    //                                           cells: [
    //                                             DataCell(
    //                                               Padding(
    //                                                 padding:
    //                                                     const EdgeInsets
    //                                                         .all(8.0),
    //                                                 child: SizedBox(
    //                                                     width: 100,
    //                                                     child: Text(
    //                                                         data.name)),
    //                                               ),
    //                                             ),
    //                                             ...data.grades.map((e) {
    //                                               return DataCell(
    //                                                 Center(
    //                                                   child: Text(
    //                                                       "${e.grade}"),
    //                                                 ),
    //                                               );
    //                                             }).toList(),
    //                                           ],
    //                                         );
    //                                       }).toList(),
    //                                     )
    //                                   : DataTable(
    //                                       columnSpacing: 20,
    //                                       columns: const [
    //                                         DataColumn(
    //                                           label: SizedBox(
    //                                             width: 80,
    //                                             child: Text("Name"),
    //                                           ),
    //                                         ),
    //                                         DataColumn(
    //                                           label: Text("Grade"),
    //                                         ),
    //                                       ],
    //                                       rows: subjectList!.map((e) {
    //                                         return DataRow(
    //                                           cells: [
    //                                             DataCell(
    //                                               SizedBox(
    //                                                   width: MediaQuery.of(
    //                                                               context)
    //                                                           .size
    //                                                           .width *
    //                                                       0.5,
    //                                                   child: Text(e.name)),
    //                                             ),
    //                                             DataCell(
    //                                               Center(
    //                                                   child: Text(
    //                                                       "${e.grades[0].grade}")),
    //                                             ),
    //                                           ],
    //                                         );
    //                                       }).toList(),
    //                                     ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   );
    //                 },
    //               )
    //             : Center(
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Text(
    //                       "You are currently not enrolled.",
    //                       style: theme.textTheme.titleMedium,
    //                     ),
    //                     const SizedBox(height: 4.0),
    //                     const Text(
    //                       "Please enroll first to see your grades",
    //                     ),
    //                     const SizedBox(height: 24.0),
    //                     InkWell(
    //                       onTap: () {
    //                         context.pushRoute(StudentMobileEnrollmentRoute(
    //                           applicationInfo: widget.applicationInfo,
    //                         ));
    //                       },
    //                       child: Text(
    //                         "Click here to enroll ->",
    //                         style: theme.textTheme.bodyMedium!.copyWith(
    //                           color: ColorTheme.primaryRed,
    //                           decoration: TextDecoration.underline,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //     ),
    //   ),
    // );
  }
}
