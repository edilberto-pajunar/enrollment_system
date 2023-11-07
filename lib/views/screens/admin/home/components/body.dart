import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/models/payment.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/router/routes.gr.dart';
import 'package:web_school/values/strings/images.dart';
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
    final AdminDB adminDB = Provider.of<AdminDB>(context);

    return Container(
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dashboard",
              style: theme.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12.0),
            Divider(
              color: Colors.black,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomAdminCard(
                    title: "Total Students: ${studentList.length}",
                    imageIcon: PngImages.students,
                    subtitle: "MANAGE STUDENTS",
                    onTap: () {
                      adminDB.updateIndexDashboard(1);
                    },
                    color: Colors.deepPurple.shade300,
                  ),
                ),

                Expanded(
                  child: CustomAdminCard(
                    title: "Total Teachers: ${instructorList.length}",
                    imageIcon: PngImages.instructors,
                    subtitle: "MANAGE TEACHERS",
                    onTap: () {
                      adminDB.updateIndexDashboard(2);
                    },
                    color: Colors.blue,
                  ),
                ),

                Expanded(
                  child: CustomAdminCard(
                    title: "Total Payments: ${paymentList.length}",
                    imageIcon: PngImages.payment,
                    subtitle: "MANAGE PAYMENTS",
                    onTap: () {
                      adminDB.updateIndexDashboard(3);
                    },
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            // Row(
            //   children: [
            //     Expanded(
            //       child: CustomAdminCard(
            //         title: "${studentList.length}",
            //         subtitle: "Total Students",
            //         onTap: () {
            //           adminDB.updateIndexDashboard(1);
            //         },
            //         color: Colors.blue,
            //       ),
            //     ),
            //     const SizedBox(width: 12.0),
            //     Expanded(
            //       child: CustomAdminCard(
            //         title: "${instructorList.length}",
            //         subtitle: "Total Instructors",
            //         onTap: () {
            //           adminDB.updateIndexDashboard(2);
            //         },
            //         color: Colors.green,
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 12.0),
            // CustomAdminCard(
            //   title: "${paymentList.length}",
            //   subtitle: "Total Payments",
            //   onTap: () {
            //     adminDB.updateIndexDashboard(3);
            //   },
            //   color: Colors.red,
            // ),

          ],
        ),
      ),
    );
  }
}
