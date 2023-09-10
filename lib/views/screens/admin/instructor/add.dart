import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/commons.dart';
import 'package:web_school/values/strings/colors.dart';
import 'package:web_school/views/widgets/fields/primary.dart';

@RoutePage()
class AdminAddInstructorScreen extends StatefulWidget {
  const AdminAddInstructorScreen({
    super.key,
  });

  @override
  State<AdminAddInstructorScreen> createState() =>
      _AdminAddInstructorScreenState();
}

class _AdminAddInstructorScreenState extends State<AdminAddInstructorScreen> {
  @override
  Widget build(BuildContext context) {
    final AdminDB adminDB = Provider.of<AdminDB>(context);
    final ThemeData theme = Theme.of(context);

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
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: adminDB.gradeList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.3,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            adminDB.updateGradeInstructor(
                                adminDB.gradeList[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: adminDB.gradeInstructor ==
                                        adminDB.gradeList[index]
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.5,
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
                      },
                    ),
                    const SizedBox(height: 50.0),
                    ElevatedButton(
                      onPressed: adminDB.validateAddInstructor
                          ? () {
                              if (AdminDB.addInstructorFormKey.currentState!
                                  .validate()) {
                                adminDB.addInstructor(context);
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorTheme.primaryRed,
                          maximumSize: const Size(double.infinity, 60),
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          )),
                      child: const Text("Submit"),
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
