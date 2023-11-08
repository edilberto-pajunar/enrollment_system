import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/models/payment.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/views/screens/admin/body/dashboard/admin_dashboard.dart';
import 'package:web_school/views/screens/admin/body/instructor/general/instructor_list.dart';
import 'package:web_school/views/screens/admin/body/payment/payment_list.dart';
import 'package:web_school/views/screens/admin/body/student/student_list.dart';
import 'package:web_school/views/screens/admin/navigation_bar/navigation_bar.dart';

@RoutePage()
class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({
    required this.studentList,
    required this.paymentList,
    required this.instructorList,
    super.key,
  });

  final List<ApplicationInfo> studentList;
  final List<Payment> paymentList;
  final List<Instructor> instructorList;


  @override
  Widget build(BuildContext context) {
    final AdminDB adminDB = Provider.of<AdminDB>(context);

    final List<Widget> dashboardList = [
      CustomAdminDashboardScreen(
        studentList: studentList,
        instructorList: instructorList,
        paymentList: paymentList,
      ),
      AdminStudentsListScreen(
        studentList: studentList,
      ),
      AdminInstructorListScreen(
        instructorList: instructorList,
      ),
      SummaryPaymentScreen(
        applicationInfo: studentList,
        paymentList: paymentList,
      ),
    ];

    return SafeArea(
      child: Scaffold(
        body: CustomNavigationBar(
          child: dashboardList[adminDB.indexDashboard],
        ),
      ),
    );
  }
}
