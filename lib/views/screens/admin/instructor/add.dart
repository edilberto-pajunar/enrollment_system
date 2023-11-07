import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/commons.dart';
import 'package:web_school/values/strings/colors.dart';
import 'package:web_school/views/widgets/buttons/primary.dart';
import 'package:web_school/views/widgets/fields/primary.dart';
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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              adminDB.clearInstructorForm();
              context.popRoute();
            },
          ),
        ),
        body: GestureDetector(
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
                    PrimaryTextField(
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
                    PrimaryTextField(
                      fieldKey: AdminDB.firstNameKey,
                      controller: AdminDB.firstName,
                      label: "First Name",
                      hintText: "First Name",
                      validator: Commons.forcedTextValidator,
                    ),
                    PrimaryTextField(
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
                      children: List.generate(adminDB.gradeList.length, (index) {
                        return Container(
                          width: size.width * 0.3,
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: adminDB.gradeInstructor == adminDB.gradeList[index]
                                  ? Colors.grey
                                  : null,
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.0),
                            onTap: () {
                              adminDB.updateGradeInstructor(adminDB.gradeList[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(adminDB.gradeList[index].label!)),
                            ),
                          ),
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
                      children: List.generate(adminDB.sectionList.length, (index) {
                        return InkWell(
                          onTap: () {
                            adminDB.updateInstructorSection(
                                adminDB.sectionList[index]);
                          },
                          child: Container(
                            width: size.width * 0.3,
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: adminDB.instructorSection ==
                                        adminDB.sectionList[index]
                                    ? Colors.grey
                                    : Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Center(
                                child: Text(adminDB.sectionList[index].label!)),
                          ),
                        );
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
                            children: List.generate(adminDB.sectionList.length, (index) {
                              return InkWell(
                                onTap: () {
                                  adminDB.updateSemesterInstructorOption(adminDB.semesterList[index]);
                                },
                                child: Container(
                                  width: size.width * 0.3,
                                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                                  margin: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: adminDB.semesterInstructorOption == adminDB.semesterList[index]
                                          ? Colors.grey
                                          : Colors.white,
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0)),
                                  child: Center(
                                      child: Text(adminDB.semesterList[index].label!)),
                                ),
                              );
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
                            children: List.generate(adminDB.strandInstructorList.length, (index) {
                              return InkWell(
                                onTap: () {
                                  adminDB.updateStrandInstructorOption(
                                    adminDB.strandInstructorList[index],
                                  );
                                },
                                child: Container(
                                  width: size.width * 0.3,
                                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                                  margin: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: adminDB.strandInstructorOption ==
                                          adminDB.strandInstructorList[index]
                                          ? Colors.grey
                                          : Colors.white,
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0)),
                                  child: Center(
                                    child: Text(adminDB.strandInstructorList[index].label ?? "",
                                    ),
                                  ),
                                ),
                              );
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
                            children: List.generate(adminDB.getSubjectInstructor.length, (index) {
                              return InkWell(
                                onTap: () {
                                  adminDB.updateSubjectOption(
                                    adminDB.getSubjectInstructor[index],
                                  );
                                },
                                child: Container(
                                  width: size.width * 0.3,
                                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                                  margin: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: adminDB.subjectOption.contains(adminDB.getSubjectInstructor[index])
                                          ? Colors.grey
                                          : Colors.white,
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0)),
                                  child: Center(
                                    child: Text(adminDB.getSubjectInstructor[index].name,
                                      style: theme.textTheme.bodySmall,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50.0),
                    PrimaryButton(
                      onPressed: adminDB.validateAddInstructor
                          ? () {
                              if (AdminDB.addInstructorFormKey.currentState!.validate()) {
                                adminDB.addInstructor(context);
                              }
                            }
                          : null,
                      label: "Submit",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
