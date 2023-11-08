import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:web_school/extensions/student_table.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/student.dart';

@RoutePage()
class AdminStudentsListScreen extends StatelessWidget {
  AdminStudentsListScreen({
    required this.studentList,
    super.key,
  });

  final List<ApplicationInfo> studentList;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final StudentDB studentDB = Provider.of<StudentDB>(context);
    final AdminDB adminDB = Provider.of<AdminDB>(context);
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    final DataTableSource _dataList = StudentDataList(
      context: context,
      dataList: studentList,
    );

    return ModalProgressHUD(
      inAsyncCall: studentDB.isLoading,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: double.infinity,

          child: PaginatedDataTable(
            columns: [
              DataColumn(label: Text("User")),
              DataColumn(label: Text("Control Number")),
              DataColumn(label: Text("Grade")),
              DataColumn(label: Text("Delete")),
            ],
            columnSpacing: 0,
            horizontalMargin: 10,
            rowsPerPage: 10,
            source: _dataList,

          ),
          // child: DataTable(
          //   dataRowMaxHeight: 60,
          //   columnSpacing: 3,
          //   headingTextStyle: theme.textTheme.bodyMedium!.copyWith(
          //     fontWeight: FontWeight.bold,
          //   ),
          //   columns: const [
          //     DataColumn(
          //       label: SizedBox(
          //         width: 50,
          //         child: Text("User"),
          //       ),
          //     ),
          //     DataColumn(
          //         label: SizedBox(
          //           child: Text("Control Number", softWrap: true,
          //           ),
          //         )),
          //     // DataColumn(
          //     //   label: SizedBox(
          //     //     width: 80,
          //     //     child: Text("Password"),
          //     //   ),
          //     // ),
          //     DataColumn(
          //       label: SizedBox(
          //         width: 50,
          //         child: Text("Grade"),
          //       ),
          //     ),
          //     DataColumn(
          //       label: Icon(Icons.group_remove_rounded),
          //     ),
          //   ],
          //   rows: studentList.map((e) {
          //     return DataRow(cells: [
          //       DataCell(
          //         SizedBox(
          //           width: 120,
          //           child: Row(
          //             children: [
          //               Expanded(child: Text(e.studentInfo.name)),
          //
          //             ],
          //           ),
          //         ),
          //       ),
          //       DataCell(
          //         SizedBox(
          //           width: 100,
          //           child: OnHoverTextButton(
          //             onTap: () {
          //               adminDB.updateStudentId(e.userModel.id);
          //               context.pushRoute(AdminStudentProfileRoute());
          //             },
          //             label: e.userModel.controlNumber,
          //           ),
          //         ),
          //       ),
          //       // DataCell(
          //       //   GestureDetector(
          //       //     onTap: () => toggleShowPass(),
          //       //     child: Text(
          //       //       showPass
          //       //           ? e.userModel.password.replaceAll(RegExp(r"."), "*")
          //       //           : e.userModel.password,
          //       //     ),
          //       //   ),
          //       // ),
          //       DataCell(
          //         SizedBox(
          //             width: 80,
          //             child: Text("${e.schoolInfo.gradeToEnroll.label}")),
          //       ),
          //       DataCell(
          //         InkWell(
          //           borderRadius: BorderRadius.circular(24.0),
          //           onTap: () async {
          //             // await adminDB.deleteStudent(context,
          //             //   id: e.userModel.id,
          //             // );
          //           },
          //           child: const Icon(CupertinoIcons.delete),
          //         ),
          //       ),
          //     ]);
          //   }).toList(),
          // ),
        ),
      ),
    );
  }
}
