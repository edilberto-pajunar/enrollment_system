import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/networks/application.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/networks/router/routes.gr.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/values/strings/images.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

class StudentDrawer extends StatefulWidget {
  const StudentDrawer({super.key});

  @override
  State<StudentDrawer> createState() => _StudentDrawerState();
}

class _StudentDrawerState extends State<StudentDrawer> {
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
    final ThemeData theme = Theme.of(context);
    final Auth auth = Provider.of<Auth>(context);
    final StudentDB studentDB = Provider.of<StudentDB>(context);

    return Drawer(
      child: StreamWrapper<ApplicationInfo>(
          stream: studentDB.studentStream,
          child: (studentData) {
            return Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    PngImages.background,
                    height: 100,
                    width: 100,
                  ),
                ),
                ListTile(
                  onTap: () {
                    context.pushRoute(ChangePasswordRoute(
                      currentPassword: studentData!.studentInfo.password,
                    ));
                  },
                  title: const Text("Change Password"),
                ),
                ListTile(
                  onTap: () {
                    // nav.pop(context);
                    // nav.pushNamed(context, name: StudentEnrollmentScreen.route);
                  },
                  title: const Text("Enrollment"),
                ),
                // ListTile(
                //   onTap: () {
                //     // nav.pop(context);
                //     // nav.pushNamed(context, name: PersonalGradesScreen.route);
                //   },
                //   title: const Text("Grades"),
                // ),
                ListTile(
                  onTap: () {
                    context.pushRoute(
                      StudentMobileInfoRoute(
                        applicationInfo: studentData!,
                      ),
                    );
                  },
                  title: const Text("Profile"),
                ),
                ListTile(
                  onTap: () {
                    auth.logout(context);
                  },
                  title: Text(
                    "Logout",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
