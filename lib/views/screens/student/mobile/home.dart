import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/views/screens/student/mobile/grades/grades.dart';
import 'package:web_school/views/screens/student/mobile/profile/profile.dart';

@RoutePage()
class StudentMobileHomeScreen extends StatefulWidget {
  const StudentMobileHomeScreen({super.key});

  @override
  State<StudentMobileHomeScreen> createState() =>
      _StudentMobileHomeScreenState();
}

class _StudentMobileHomeScreenState extends State<StudentMobileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final StudentDB studentDB = Provider.of<StudentDB>(context);

    final List<Widget> screenList = [
      const StudentMobileProfileScreen(),
      const StudentMobileGradeScreen(),
    ];

    return SafeArea(
      child: Scaffold(
        // drawer: const StudentDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: studentDB.selectedIndex,
          onTap: studentDB.updateSelectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grade),
              label: "Grades",
            ),
          ],
        ),
        body: screenList[studentDB.selectedIndex],
      ),
    );
  }
}
