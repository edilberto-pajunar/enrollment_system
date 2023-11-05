import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/views/widgets/fields/primary.dart';

@RoutePage()
class InstructorProfileScreen extends StatelessWidget {
  const InstructorProfileScreen({
    required this.instructor,
    super.key,
  });

  final Instructor instructor;

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Profile",
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                const SizedBox(height: 24.0),
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    child: Icon(CupertinoIcons.profile_circled,
                      size: 80,
                    ),
                  ),
                ),
                PrimaryTextField(
                  controller: TextEditingController(text: instructor.userModel.controlNumber),
                  label: "Control Number",
                  readOnly: true,
                ),
                PrimaryTextField(
                  controller: TextEditingController(text: instructor.firstName),
                  label: "First Name",
                  readOnly: true,
                ),
                PrimaryTextField(
                  controller: TextEditingController(text: instructor.lastName),
                  label: "Last Name",
                  readOnly: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
