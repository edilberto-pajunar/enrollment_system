import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/commons.dart';
import 'package:web_school/values/strings/colors.dart';
import 'package:web_school/views/widgets/buttons/primary.dart';
import 'package:web_school/views/widgets/fields/primary.dart';

@RoutePage()
class AdminEditInstructorScreen extends StatefulWidget {
  const AdminEditInstructorScreen({
    required this.instructorData,
    super.key,
  });

  final Instructor instructorData;

  @override
  State<AdminEditInstructorScreen> createState() =>
      _AdminEditInstructorScreenState();
}

class _AdminEditInstructorScreenState extends State<AdminEditInstructorScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final AdminDB adminDB = Provider.of<AdminDB>(context, listen: false);

      setState(() {
        AdminDB.firstName.text = widget.instructorData.firstName;
        AdminDB.lastName.text = widget.instructorData.lastName;
        AdminDB.username.text = widget.instructorData.username;

        adminDB.instructorSection = widget.instructorData.section;
        adminDB.gradeInstructor = widget.instructorData.grade;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AdminDB adminDB = Provider.of<AdminDB>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.popRoute();
              adminDB.clearInstructorForm();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PrimaryTextField(
                  fieldKey: AdminDB.usernameKey,
                  controller: AdminDB.username,
                  label: "Username",
                  hintText: "Username",
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
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
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: adminDB.gradeList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 4.3,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        adminDB.updateGradeInstructor(adminDB.gradeList[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: adminDB.gradeInstructor?.id ==
                                    adminDB.gradeList[index].id
                                ? Colors.grey
                                : Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Center(
                            child: Text(adminDB.gradeList[index].label!)),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24.0),
                Text(
                  "Please choose a section for the instructor",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: adminDB.sectionList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 4.3,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        adminDB.updateInstructorSection(
                            adminDB.sectionList[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: adminDB.instructorSection?.id ==
                                    adminDB.sectionList[index].id
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
                  },
                ),
                const SizedBox(height: 50.0),
                PrimaryButton(
                  label: "Save",
                  onPressed: adminDB.validateAddInstructor
                      ? () {
                          if (AdminDB.addInstructorFormKey.currentState!
                              .validate()) {
                            adminDB.editInstructor(context);
                          }
                        }
                      : null,
                ),
                // ElevatedButton(
                //   onPressed: adminDB.validateAddInstructor
                //       ? () {
                //           if (AdminDB.addInstructorFormKey.currentState!
                //               .validate()) {
                //             adminDB.addInstructor(context);
                //           }
                //         }
                //       : null,
                //   style: ElevatedButton.styleFrom(
                //       backgroundColor: ColorTheme.primaryRed,
                //       maximumSize: const Size(double.infinity, 60),
                //       padding: const EdgeInsets.symmetric(vertical: 12.0),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(12.0),
                //       )),
                //   child: const Text("Submit"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
