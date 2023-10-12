import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/networks/student.dart';

@RoutePage()
class StudentMobileProfileScreen extends StatefulWidget {
  const StudentMobileProfileScreen({
    required this.applicationInfo,
    super.key,
  });

  final ApplicationInfo applicationInfo;

  @override
  State<StudentMobileProfileScreen> createState() =>
      _StudentMobileProfileScreenState();
}

class _StudentMobileProfileScreenState extends State<StudentMobileProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final StudentDB studentDB = Provider.of<StudentDB>(context);
    final ThemeData theme = Theme.of(context);

    final personal = widget.applicationInfo.personalInfo;

    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Welcome, ${personal.firstName} ${personal.lastName}",
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: 24.0),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Text(
                      "Admission Status: ${studentDB.enrollmentStatus(widget.applicationInfo.studentInfo)}"),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
