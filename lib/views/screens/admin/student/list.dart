import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:web_school/extensions/table.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/router/routes.gr.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/views/widgets/hover/text.dart';

@RoutePage()
class AdminStudentsScreen extends StatelessWidget {
  AdminStudentsScreen({
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

    final MyData<ApplicationInfo> _dataList = MyData(dataList: studentList);

    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: studentDB.isLoading,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: PaginatedDataTable(
                columns: [],
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
              //   rows: widget.studentList.map((e) {
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
        ),
      ),
    );
  }
}
