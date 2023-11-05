import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/router/routes.gr.dart';
import 'package:web_school/values/strings/colors.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

@RoutePage()
class AdminInstructorListScreen extends StatefulWidget {
  const AdminInstructorListScreen({super.key});

  @override
  State<AdminInstructorListScreen> createState() =>
      _AdminInstructorListScreenState();
}

class _AdminInstructorListScreenState extends State<AdminInstructorListScreen> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final AdminDB adminDB = Provider.of<AdminDB>(context, listen: false);
      adminDB.updateInstructorListStream();
    });
  }

  @override
  Widget build(BuildContext context) {
    final AdminDB adminDB = Provider.of<AdminDB>(context);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: !kIsWeb ? AppBar(
        title: const Text("Instructor"),
      ) : null,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme.primaryRed,
        onPressed: () {
          context.pushRoute(const AdminAddInstructorRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: StreamWrapper<List<Instructor>>(
            stream: adminDB.instructorListStream,
            child: (instructorList) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: adminDB.generalYearList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              adminDB.updateGeneralYear(adminDB.generalYearList[index]);
                              context.pushRoute(const AdminInstructorGradeRoute());
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 12.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(adminDB.generalYearList[index].label!),
                                  const Icon(Icons.arrow_right),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Text(
                        "Note: Default password is 123456",
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      DataTable(
                        columnSpacing: 30,
                        columns: const [
                          DataColumn(
                            label: Text(
                              "Name",
                            ),
                          ),
                          DataColumn(
                            label: Text("Grade"),
                          ),
                          DataColumn(
                            label: Text("Section"),
                          ),
                          // DataColumn(
                          //   label: Icon(Icons.remove),
                          // ),
                        ],
                        rows: instructorList!.map((e) {
                          return DataRow(
                            cells: [
                              DataCell(
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            adminDB.updateInstructorId(e.userModel.id);
                                            context.pushRoute(AdminEditInstructorRoute(
                                                instructorData: e,
                                              ),
                                            );
                                          },
                                          child: Text(
                                            style: theme.textTheme.bodyMedium!.copyWith(
                                              color: Colors.blue,
                                              decoration: TextDecoration.underline,
                                            ),
                                            e.username,
                                          ),
                                        ),
                                      ),
                                      IconButton(onPressed: () {
                                        adminDB.updateInstructorId(e.userModel.id);
                                        adminDB.deleteInstructor(context);
                                      }, icon: Icon(Icons.delete,
                                        color: Colors.red,
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(width: 60, child: Text(e.grade!.label!)),
                              ),
                              DataCell(
                                Center(
                                  child: Text(e.section!.label!),
                                ),
                              ),
                              // DataCell(
                              //   GestureDetector(
                              //     onTap: () {
                              //       adminDB.updateInstructorId(e.userModel.id);
                              //       adminDB.deleteInstructor(context);
                              //     },
                              //     child: const Icon(
                              //       Icons.delete,
                              //       color: Colors.red,
                              //     ),
                              //   ),
                              // ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
