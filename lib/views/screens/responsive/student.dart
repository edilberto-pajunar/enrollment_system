import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/user.dart';
import 'package:web_school/views/screens/student/mobile/home.dart';
import 'package:web_school/views/screens/web/student/home.dart';

@RoutePage()
class StudentLayoutBuilder extends StatelessWidget {
  static String route = "/studentLayoutBuilder";
  const StudentLayoutBuilder({
    required this.userModel,
    super.key,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return StudentMobileHomeScreen(
            userModel: userModel,
          );
        } else {
          return WebStudentHomeScreen(
            userModel: userModel,
          );
        }
      },
    );
  }
}
