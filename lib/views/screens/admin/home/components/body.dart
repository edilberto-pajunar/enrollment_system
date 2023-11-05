import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/models/payment.dart';
import 'package:web_school/networks/router/routes.gr.dart';
import 'package:web_school/views/widgets/cards/custom_admin.dart';

class AdminBody extends StatelessWidget {
  const AdminBody({
    required this.studentList,
    required this.instructorList,
    required this.paymentList,
    super.key,
  });

  final List<ApplicationInfo> studentList;
  final List<Instructor> instructorList;
  final List<Payment> paymentList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    return Container(
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Dashboard",
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              Expanded(
                child: CustomAdminCard(
                  title: "3",
                  subtitle: "Listed Classes",
                  onTap: () {},
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              Expanded(
                child: CustomAdminCard(
                  title: "${studentList.length}",
                  subtitle: "Total Students",
                  onTap: () => context.pushRoute(AdminStudentsRoute()),
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: CustomAdminCard(
                  title: "${instructorList.length}",
                  subtitle: "Total Instructors",
                  onTap: () => context.pushRoute(AdminInstructorListRoute()),
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          CustomAdminCard(
            title: "${paymentList.length}",
            subtitle: "Total Payments",
            onTap: () => context.pushRoute(SummaryPaymentRoute(
                applicationInfo: studentList,
                paymentList: paymentList,
              ),
            ),
            color: Colors.red,
          ),

        ],
      ),
    );
  }
}
