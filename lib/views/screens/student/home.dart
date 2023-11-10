import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/views/screens/student/body/profile/change_pass.dart';
import 'package:web_school/views/screens/student/body/profile/enrollment.dart';
import 'package:web_school/views/screens/student/body/profile/grades.dart';
import 'package:web_school/views/screens/student/body/profile/profile.dart';
import 'package:web_school/views/screens/student/body/profile/schedule.dart';
import 'package:web_school/views/screens/student/mobile/payment/home.dart';
import 'package:web_school/views/screens/student/navigation_bar/navigation_bar.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

@RoutePage()
class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final StudentDB studentDB = Provider.of<StudentDB>(context, listen: false);
      final AdminDB adminDB = Provider.of<AdminDB>(context, listen: false);
      adminDB.getStudentIdLocal().then((value) {
        studentDB.updateStudentStream(adminDB.studentId!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final StudentDB studentDB = Provider.of<StudentDB>(context);

    return Scaffold(
      body: SafeArea(
        child: StudentNavigationBar(
          child: StreamWrapper<ApplicationInfo>(
            stream: studentDB.studentStream,
            child: (applicationInfo) {
              final List<Widget> screenList = [
                StudentWebProfileScreen(
                  applicationInfo: applicationInfo!,
                ),
                StudentWebGradesScreen(
                  applicationInfo: applicationInfo,
                ),
                StudentWebEnrollmentScreen(
                  applicationInfo: applicationInfo,
                ),
                StudentWebScheduleScreen(
                  applicationInfo: applicationInfo,
                ),
                StudentPaymentHomeScreen(
                  applicationInfo: applicationInfo,
                ),
                StudentWebChangePassScreen(
                  applicationInfo: applicationInfo,
                ),
              ];

              return screenList[studentDB.studentIndex];
            },
          ),
        ),
      ),
    );
  }
}
