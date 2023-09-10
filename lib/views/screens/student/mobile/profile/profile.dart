import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';
import 'package:web_school/views/widgets/drawer/student.dart';

@RoutePage()
class StudentMobileProfileScreen extends StatefulWidget {
  const StudentMobileProfileScreen({super.key});

  @override
  State<StudentMobileProfileScreen> createState() =>
      _StudentMobileProfileScreenState();
}

class _StudentMobileProfileScreenState
    extends State<StudentMobileProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final StudentDB studentDB =
          Provider.of<StudentDB>(context, listen: false);
      studentDB.updateStudentStream();
    });
  }

  @override
  Widget build(BuildContext context) {
    final StudentDB studentDB = Provider.of<StudentDB>(context);
    final Auth auth = Provider.of<Auth>(context);
    final ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                auth.logout(context);
              },
              child: Text(
                "Logout",
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        drawer: const StudentDrawer(),
        body: StreamWrapper<ApplicationInfo>(
            stream: studentDB.studentStream,
            child: (applicationInfo) {
              final personal = applicationInfo!.personalInfo;
              return Padding(
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
                          "Admission Status: ${studentDB.enrollmentStatus(applicationInfo.studentInfo)}"),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
