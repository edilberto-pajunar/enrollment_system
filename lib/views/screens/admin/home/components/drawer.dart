import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/models/payment.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/networks/router/routes.gr.dart';
import 'package:web_school/values/strings/colors.dart';
import 'package:web_school/values/strings/images.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key,
    required this.studentList,
    required this.instructorList,
    required this.paymentList,
  });

  final List<ApplicationInfo> studentList;
  final List<Instructor> instructorList;
  final List<Payment> paymentList;
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    final AdminDB adminDB = Provider.of<AdminDB>(context);
    final Auth auth = Provider.of<Auth>(context);

    final style = theme.textTheme.bodyMedium!.copyWith(
      color: Colors.white,
    );

    return SizedBox(
      height: size.height,
      child: Drawer(
        width: 230,
        backgroundColor: ColorTheme.primaryBlack,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Text("Admin Dashboard",
            //     style: theme.textTheme.titleLarge!.copyWith(
            //       color: Colors.white,
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            SizedBox(
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(PngImages.background,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text("Administrator",
                      style: style,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text("Dashboard",
                style: style,
              ),
              leading: Icon(Icons.dashboard,
                color: Colors.white,
              ),
              onTap: () {
                adminDB.updateIndexDashboard(0);
                context.popRoute();
              },
            ),
            ListTile(
              title: Text("Teachers",
                style: style,
              ),
              leading: Icon(Icons.supervised_user_circle_rounded,
                color: Colors.white,
              ),
              onTap: () {
                adminDB.updateIndexDashboard(2);
                context.popRoute();
              },
            ),
            ListTile(
              title: Text("Students",
                style: style,
              ),
              leading: Icon(Icons.supervised_user_circle_rounded,
                color: Colors.white,
              ),
              onTap: () {
                adminDB.updateIndexDashboard(1);
                context.popRoute();
              },
            ),
            ListTile(
              title: Text("Payments",
                style: style,
              ),
              leading: Icon(Icons.payment,
                color: Colors.white,
              ),
              onTap: () {
                adminDB.updateIndexDashboard(3);
                context.popRoute();
              },
            ),
            ListTile(
              title: Text("Logout",
                style: style,
              ),
              leading: Icon(Icons.logout,
                color: Colors.white,
              ),
              onTap: () => auth.logout(context),
            ),
          ],
        ),
      ),
    );

    // return Container(
    //   height: size.height,
    //   decoration: BoxDecoration(
    //     color: Colors.black12,
    //     borderRadius: BorderRadius.only(
    //       topRight: Radius.circular(12.0),
    //       bottomRight: Radius.circular(12.0),
    //     ),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Text("Admin"),
    //       ),
    //       Divider(),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           children: [
    //             SizedBox(
    //               width: 50,
    //               height: 50,
    //               child: Image.asset(PngImages.background,
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             const SizedBox(width: 12.0),
    //             Text("admin"),
    //           ],
    //         ),
    //       ),
    //       Divider(),
    //       ListTile(
    //         title: Text("Dashboard"),
    //         leading: Icon(Icons.dashboard),
    //         onTap: () {},
    //       ),
    //       ListTile(
    //         title: Text("Teachers"),
    //         trailing: Icon(Icons.arrow_back_ios_new,
    //
    //         ),
    //         leading: Icon(Icons.supervised_user_circle_rounded,
    //         ),
    //         onTap: () => context.pushRoute(AdminInstructorListRoute(),
    //         ),
    //       ),
    //       ListTile(
    //         title: Text("Students"),
    //         trailing: Icon(Icons.arrow_back_ios_new),
    //         leading: Icon(Icons.supervised_user_circle_rounded,
    //           size: 25,
    //         ),
    //         onTap: () => context.pushRoute(const AdminStudentsRoute()),
    //       ),
    //       ListTile(
    //         title: Text("Payments"),
    //         trailing: Icon(Icons.arrow_back_ios_new),
    //         leading: Icon(Icons.payment,
    //           size: 25,
    //         ),
    //         onTap: () => context.pushRoute(SummaryPaymentRoute(
    //           applicationInfo: studentList,
    //           paymentList: paymentList,
    //         )),
    //       ),
    //       ListTile(
    //         title: Text("Logout"),
    //         trailing: Icon(Icons.arrow_back_ios_new,
    //
    //         ),
    //         leading: Icon(Icons.logout,
    //         ),
    //         onTap: () {},
    //       ),
    //     ],
    //   ),
    // );
  }
}
