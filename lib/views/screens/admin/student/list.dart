import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/router/routes.gr.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

@RoutePage()
class AdminStudentsScreen extends StatefulWidget {
  const AdminStudentsScreen({super.key});

  @override
  State<AdminStudentsScreen> createState() => _AdminStudentsScreenState();
}

class _AdminStudentsScreenState extends State<AdminStudentsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final StudentDB db = Provider.of<StudentDB>(context, listen: false);
      db.updateStudentListStream();
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  bool showPass = true;

  void toggleShowPass() {
    setState(() {
      showPass = !showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    final StudentDB studentDB = Provider.of<StudentDB>(context);
    final AdminDB adminDB = Provider.of<AdminDB>(context);
    final ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(),
        body: ModalProgressHUD(
          inAsyncCall: studentDB.isLoading,
          child: StreamWrapper<List<ApplicationInfo>>(
              stream: studentDB.studentListStream,
              child: (student) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 5,
                      headingTextStyle: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      columns: const [
                        DataColumn(
                          label: SizedBox(
                            width: 50,
                            child: Text("User"),
                          ),
                        ),
                        DataColumn(
                            label: SizedBox(
                          width: 100,
                          child: Text(
                            "Control Number",
                            softWrap: true,
                          ),
                        )),
                        DataColumn(
                          label: SizedBox(
                            width: 80,
                            child: Text("Password"),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 50,
                            child: Text("Grade"),
                          ),
                        ),
                        DataColumn(
                          label: Icon(Icons.group_remove_rounded),
                        ),
                      ],
                      rows: student!.map((e) {
                        return DataRow(cells: [
                          DataCell(
                            SizedBox(
                              width: 80,
                              child: Text(e.studentInfo.name),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              width: 100,
                              child: InkWell(
                                onTap: () {
                                  adminDB.updateStudentId(e.studentInfo.id);
                                  context.pushRoute(
                                      const AdminStudentProfileRoute());
                                },
                                child: Text(
                                  e.studentInfo.name,
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            GestureDetector(
                              onTap: () => toggleShowPass(),
                              child: Text(
                                showPass
                                    ? e.studentInfo.password
                                        .replaceAll(RegExp(r"."), "*")
                                    : e.studentInfo.password,
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                                width: 80,
                                child: Text(
                                    "${e.schoolInfo.gradeToEnroll.label}")),
                          ),
                          DataCell(
                            InkWell(
                              borderRadius: BorderRadius.circular(24.0),
                              onTap: () async {
                                adminDB.updateStudentId(e.studentInfo.id);
                                await adminDB.deleteStudent(context);
                              },
                              child: const Icon(Icons.close),
                            ),
                          ),
                        ]);
                      }).toList(),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
