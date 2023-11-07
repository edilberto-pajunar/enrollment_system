import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/models/payment.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/networks/payment.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/values/strings/colors.dart';
import 'package:web_school/views/screens/admin/home/components/body.dart';
import 'package:web_school/views/screens/admin/home/components/drawer.dart';
import 'package:web_school/views/screens/admin/instructor/general/list.dart';
import 'package:web_school/views/screens/admin/payment/summary.dart';
import 'package:web_school/views/screens/admin/student/list.dart';
import 'package:web_school/views/widgets/app_bar/admin.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

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
    final StudentDB studentDB = Provider.of<StudentDB>(context);
    final PaymentDB paymentDB = Provider.of<PaymentDB>(context);
    final AdminDB adminDB = Provider.of<AdminDB>(context);
    final Auth auth = Provider.of<Auth>(context);
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    // final String date = DateFormat("MMMM-dd-yyyy").format(DateTime.now());

    final List<Widget> dashboardList = [
      AdminBody(
        studentList: studentList,
        instructorList: instructorList,
        paymentList: paymentList,
      ),
      AdminStudentsScreen(
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
        body: Row(
          children: [
            AdminDrawer(
              studentList: studentList,
              instructorList: instructorList,
              paymentList: paymentList,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAdminAppBar(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: dashboardList[adminDB.indexDashboard],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
