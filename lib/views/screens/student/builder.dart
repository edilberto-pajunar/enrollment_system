import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_school/views/screens/student/mobile/home.dart';
import 'package:web_school/views/screens/student/web/home.dart';

@RoutePage()
class StudentLayoutBuilder extends StatelessWidget {
  const StudentLayoutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const StudentMobileHomeScreen();
        } else {
          return const StudentWebHomeScreen();
        }
      },
    );
  }
}
