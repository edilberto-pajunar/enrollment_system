import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/commons.dart';
import 'package:web_school/values/strings/colors.dart';
import 'package:web_school/views/screens/admin/navigation_bar/navigation_bar.dart';
import 'package:web_school/views/widgets/buttons/primary.dart';
import 'package:web_school/views/widgets/fields/primary.dart';
import 'package:web_school/views/widgets/fields/secondart.dart';
import 'package:web_school/views/widgets/hover/button.dart';

@RoutePage()
class AdminAddInstructorScreen extends StatefulWidget {
  const AdminAddInstructorScreen({
    super.key,
  });

  @override
  State<AdminAddInstructorScreen> createState() => _AdminAddInstructorScreenState();
}

class _AdminAddInstructorScreenState extends State<AdminAddInstructorScreen> {
  @override
  Widget build(BuildContext context) {
    final AdminDB adminDB = Provider.of<AdminDB>(context);
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       adminDB.clearInstructorForm();
      //       context.popRoute();
      //     },
      //   ),
      // ),
      body: SafeArea(
        child: CustomNavigationBar(
          child: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Form(
              key: AdminDB.addInstructorFormKey,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SecondaryTextField(
                        fieldKey: AdminDB.usernameKey,
                        controller: AdminDB.username,
                        label: "Username",
                        hintText: "Username",
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9]')),
                        ],
                        validator: Commons.forcedTextValidator,
                      ),
                      const SizedBox(height: 5.0),
                      SecondaryTextField(
                        fieldKey: AdminDB.firstNameKey,
                        controller: AdminDB.firstName,
                        label: "First Name",
                        hintText: "First Name",
                        validator: Commons.forcedTextValidator,
                      ),
                      const SizedBox(height: 5.0),
                      SecondaryTextField(
                        fieldKey: AdminDB.lastNameKey,
                        controller: AdminDB.lastName,
                        label: "Last Name",
                        hintText: "Last Name",
                        validator: Commons.forcedTextValidator,
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        "Please choose a grade for the instructor",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: List.generate(adminDB.gradeList.length, (index) {
                          return PrimaryButton(
                            onPressed: () {
                              adminDB.updateGradeInstructor(adminDB.gradeList[index]);
                            },
                            color: adminDB.gradeInstructor == adminDB.gradeList[index]
                              ? Colors.white
                              : Colors.black87,
                            backgroundColor: adminDB.gradeInstructor == adminDB.gradeList[index]
                                ? Colors.black87
                                : Colors.white,
                            label: adminDB.gradeList[index].label!,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        "Please choose a section for the instructor",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: List.generate(adminDB.sectionList.length, (index) {
                          return PrimaryButton(
                            onPressed: () {
                              adminDB.updateInstructorSection(adminDB.sectionList[index]);
                            },
                            color: adminDB.instructorSection == adminDB.sectionList[index]
                                ? Colors.white
                                : Colors.black87,
                            backgroundColor: adminDB.instructorSection == adminDB.sectionList[index]
                                ? Colors.black87
                                : Colors.white,
                            label: adminDB.sectionList[index].label!,
                          );
                          // return InkWell(
                          //   onTap: () {
                          //     adminDB.updateInstructorSection(
                          //         adminDB.sectionList[index]);
                          //   },
                          //   child: Container(
                          //     width: size.width * 0.3,
                          //     padding: const EdgeInsets.symmetric(vertical: 12.0),
                          //     margin: const EdgeInsets.all(5.0),
                          //     decoration: BoxDecoration(
                          //         color: adminDB.instructorSection ==
                          //                 adminDB.sectionList[index]
                          //             ? Colors.grey
                          //             : Colors.white,
                          //         border: Border.all(
                          //           color: Colors.black,
                          //         ),
                          //         borderRadius: BorderRadius.circular(12.0)),
                          //     child: Center(
                          //         child: Text(adminDB.sectionList[index].label!)),
                          //   ),
                          // );
                        }).toList(),
                      ),

                      const SizedBox(height: 24.0),
                      Visibility(
                        visible: adminDB.gradeInstructor?.id == 4 || adminDB.gradeInstructor?.id == 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Please choose a semester for the instructor",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
                              children: List.generate(adminDB.sectionList.length, (index) {
                                return PrimaryButton(
                                  onPressed: () {
                                    adminDB.updateSemesterInstructorOption(adminDB.semesterList[index]);
                                  },
                                  color: adminDB.semesterInstructorOption == adminDB.semesterList[index]
                                      ? Colors.white
                                      : Colors.black87,
                                  backgroundColor: adminDB.semesterInstructorOption == adminDB.semesterList[index]
                                      ? Colors.black87
                                      : Colors.white,
                                  label: adminDB.semesterList[index].label!,
                                );
                                // return InkWell(
                                //   onTap: () {
                                //     adminDB.updateSemesterInstructorOption(adminDB.semesterList[index]);
                                //   },
                                //   child: Container(
                                //     width: size.width * 0.3,
                                //     padding: const EdgeInsets.symmetric(vertical: 12.0),
                                //     margin: const EdgeInsets.all(5.0),
                                //     decoration: BoxDecoration(
                                //         color: adminDB.semesterInstructorOption == adminDB.semesterList[index]
                                //             ? Colors.grey
                                //             : Colors.white,
                                //         border: Border.all(
                                //           color: Colors.black,
                                //         ),
                                //         borderRadius: BorderRadius.circular(12.0)),
                                //     child: Center(
                                //         child: Text(adminDB.semesterList[index].label!)),
                                //   ),
                                // );
                              }).toList(),
                            ),

                            const SizedBox(height: 24.0),

                            Text(
                              "Please choose a strand for the instructor",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
                              children: List.generate(adminDB.strandInstructorList.length, (index) {
                                return PrimaryButton(
                                  onPressed: () {
                                    adminDB.updateStrandInstructorOption(adminDB.strandInstructorList[index]);
                                  },
                                  color: adminDB.strandInstructorOption == adminDB.strandInstructorList[index]
                                      ? Colors.white
                                      : Colors.black87,
                                  backgroundColor: adminDB.strandInstructorOption == adminDB.strandInstructorList[index]
                                      ? Colors.black87
                                      : Colors.white,
                                  label: adminDB.strandInstructorList[index].label ?? "",
                                );
                                // return InkWell(
                                //   onTap: () {
                                //     adminDB.updateStrandInstructorOption(
                                //       adminDB.strandInstructorList[index],
                                //     );
                                //   },
                                //   child: Container(
                                //     width: size.width * 0.3,
                                //     padding: const EdgeInsets.symmetric(vertical: 12.0),
                                //     margin: const EdgeInsets.all(5.0),
                                //     decoration: BoxDecoration(
                                //         color: adminDB.strandInstructorOption ==
                                //             adminDB.strandInstructorList[index]
                                //             ? Colors.grey
                                //             : Colors.white,
                                //         border: Border.all(
                                //           color: Colors.black,
                                //         ),
                                //         borderRadius: BorderRadius.circular(12.0)),
                                //     child: Center(
                                //       child: Text(adminDB.strandInstructorList[index].label ?? "",
                                //       ),
                                //     ),
                                //   ),
                                // );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),

                      Visibility(
                        visible: adminDB.gradeInstructor != null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 24.0),
                            Text(
                              "Please choose a subject/s for the instructor",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
                              children: List.generate(adminDB.getSubjectInstructor.length, (index) {
                                return PrimaryButton(
                                  onPressed: () {
                                    adminDB.updateSubjectOption(adminDB.getSubjectInstructor[index]);
                                  },
                                  color: adminDB.subjectOption.contains(adminDB.getSubjectInstructor[index])
                                      ? Colors.white
                                      : Colors.black87,
                                  backgroundColor: adminDB.subjectOption.contains(adminDB.getSubjectInstructor[index])
                                      ? Colors.black87
                                      : Colors.white,
                                  label: adminDB.getSubjectInstructor[index].name,
                                );
                                // return InkWell(
                                //   onTap: () {
                                //     adminDB.updateSubjectOption(
                                //       adminDB.getSubjectInstructor[index],
                                //     );
                                //   },
                                //   child: Container(
                                //     width: size.width * 0.3,
                                //     padding: const EdgeInsets.symmetric(vertical: 12.0),
                                //     margin: const EdgeInsets.all(5.0),
                                //     decoration: BoxDecoration(
                                //         color: adminDB.subjectOption.contains(adminDB.getSubjectInstructor[index])
                                //             ? Colors.grey
                                //             : Colors.white,
                                //         border: Border.all(
                                //           color: Colors.black,
                                //         ),
                                //         borderRadius: BorderRadius.circular(12.0)),
                                //     child: Center(
                                //       child: Text(adminDB.getSubjectInstructor[index].name,
                                //         style: theme.textTheme.bodySmall,
                                //         textAlign: TextAlign.center,
                                //       ),
                                //     ),
                                //   ),
                                // );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 50.0),
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              onPressed: () {
                                adminDB.clearInstructorForm();
                                context.popRoute();
                              },
                              color: Colors.black87,
                              backgroundColor: Colors.white,
                              label: "Cancel",
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: PrimaryButton(
                              onPressed: adminDB.validateAddInstructor
                                  ? () {
                                if (AdminDB.addInstructorFormKey.currentState!.validate()) {
                                  adminDB.addInstructor(context);
                                }
                              }
                                  : null,
                              label: "Save",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
