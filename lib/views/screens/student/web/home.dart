import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/views/screens/student/web/profile/change_pass.dart';
import 'package:web_school/views/screens/student/web/profile/enrollment.dart';
import 'package:web_school/views/screens/student/web/profile/grades.dart';
import 'package:web_school/views/screens/student/web/profile/profile.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

@RoutePage()
class StudentWebHomeScreen extends StatefulWidget {
  const StudentWebHomeScreen({super.key});

  @override
  State<StudentWebHomeScreen> createState() => _StudentWebHomeScreenState();
}

class _StudentWebHomeScreenState extends State<StudentWebHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final StudentDB studentDB =
          Provider.of<StudentDB>(context, listen: false);
      studentDB.updateStudentStream();
    });

    controller = TabController(length: 4, vsync: this);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    final StudentDB studentDB = Provider.of<StudentDB>(context);
    // final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        bottom: TabBar(
          labelPadding: const EdgeInsets.symmetric(vertical: 8.0),
          controller: controller,
          tabs: const [
            Text("Change Password"),
            Text("Enrollment"),
            Text("Grades"),
            Text("Profile"),
          ],
        ),
      ),
      body: StreamWrapper<ApplicationInfo>(
          stream: studentDB.studentStream,
          child: (studentData) {
            return TabBarView(
              controller: controller,
              children: [
                StudentWebChangePassScreen(
                    studentInfo: studentData!.studentInfo),
                StudentWebEnrollmentScreen(
                    studentInfo: studentData.studentInfo),
                StudentWebGradesScreen(
                  applicationInfo: studentData,
                ),
                StudentWebProfileScreen(
                  applicationInfo: studentData,
                ),
              ],
            );
          }),
    );
  }
}
