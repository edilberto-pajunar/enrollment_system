import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/router/routes.gr.dart';
import 'package:web_school/views/screens/admin/body/student/profile/component/student_details.dart';
import 'package:web_school/views/screens/admin/navigation_bar/navigation_bar.dart';
import 'package:web_school/views/widgets/app_bar/admin.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

@RoutePage()
class AdminStudentProfileScreen extends StatefulWidget {
  const AdminStudentProfileScreen({
    super.key,
  });


  @override
  State<AdminStudentProfileScreen> createState() => _AdminStudentProfileScreenState();
}

class _AdminStudentProfileScreenState extends State<AdminStudentProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final AdminDB adminDB = Provider.of<AdminDB>(context, listen: false);
      adminDB.getStudentIdLocal().then((value) {
        adminDB.updateStudentStream();
        adminDB.updateListSubjectStream();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final AdminDB adminDB = Provider.of<AdminDB>(context);
    final ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     TextButton.icon(
        //       label: Icon(Icons.report,
        //         color: Colors.white,
        //       ),
        //       onPressed: () {},
        //       /// TODO: Add generate report
        //       icon: Text("Generated Report",
        //         style: theme.textTheme.bodyMedium!.copyWith(
        //           color: Colors.white,
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        body: CustomNavigationBar(
          child: Center(
            child: StreamWrapper<ApplicationInfo>(
              stream: adminDB.studentStream,
              child: (applicationInfo) {
                return StreamWrapper<List<Subject>>(
                  stream: adminDB.listSubjectStream,
                  child: (subjectList) {
                    return Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Text(applicationInfo!.studentInfo.name)),
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: applicationInfo.studentInfo.section.isEmpty
                                              ? null
                                              : () {
                                              context.pushRoute(AdminScheduleStudentRoute(),
                                            );
                                          },
                                          child: Text(
                                            "See schedule",
                                            style: theme.textTheme.bodyMedium!.copyWith(
                                              color: applicationInfo.studentInfo.section.isEmpty
                                                  ? Colors.grey
                                                  : Colors.blue,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: TextButton(
                                            onPressed: () {
                                              adminDB.assignSection(context, applicationInfo);
                                            },
                                            child: Text(
                                              "Assign",
                                              style:
                                              theme.textTheme.bodyMedium!.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Tooltip(
                                          message: "Generate report",
                                          child: IconButton(
                                            icon: Icon(CupertinoIcons.cloud_download_fill),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 12.0),
                            StudentDetails(
                              applicationInfo: applicationInfo,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
