import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/router/routes.gr.dart';
import 'package:web_school/values/strings/colors.dart';

@RoutePage()
class AdminInstructorGradeScreen extends StatelessWidget {
  const AdminInstructorGradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminDB adminDB = Provider.of<AdminDB>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instructor"),
        actions: const [],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme.primaryRed,
        onPressed: () {
          context.pushRoute( AdminAddInstructorRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
          itemCount: adminDB.juniorYear
              ? adminDB.generalJuniorList.length
              : adminDB.generalSeniorList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                adminDB.updateGeneralGrade(
                  adminDB.juniorYear
                      ? adminDB.generalJuniorList[index]
                      : adminDB.generalSeniorList[index],
                );
                context.pushRoute(const AdminInstructorSectionRoute());
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
                    Text(
                      adminDB.juniorYear
                          ? adminDB.generalJuniorList[index].label!
                          : adminDB.generalSeniorList[index].label!,
                    ),
                    const Icon(Icons.arrow_right),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
