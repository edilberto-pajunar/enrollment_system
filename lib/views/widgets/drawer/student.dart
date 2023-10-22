import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/values/strings/images.dart';

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final StudentDB studentDB = Provider.of<StudentDB>(context);
    final Auth auth = Provider.of<Auth>(context);

    return Drawer(
      width: 200,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(PngImages.background,
              scale: 5,
            ),
          ),
          Text("St. Jude Agro-Industrial Secondary School",
            style: theme.textTheme.bodyMedium!.copyWith(
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24.0),
          ListTile(
            onTap: () {
               studentDB.updateStudentDrawerIndex(0);
               if (!kIsWeb) {
                 context.popRoute();
               }
            },
            title: Text("Profile",
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          ListTile(
            onTap: () {
              studentDB.updateStudentDrawerIndex(1);
              if (!kIsWeb) {
                context.popRoute();
              }
            },
            title: Text("Grades",
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          ListTile(
            onTap: () {
              studentDB.updateStudentDrawerIndex(2);
              if (!kIsWeb) {
                context.popRoute();
              }
            },
            title: Text("Admission Status",
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          ListTile(
            onTap: () {
              studentDB.updateStudentDrawerIndex(3);
              if (!kIsWeb) {
                context.popRoute();
              }
            },
            title: Text("Schedule",
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          ListTile(
            onTap: () {
              studentDB.updateStudentDrawerIndex(4);
              if (!kIsWeb) {
                context.popRoute();
              }
            },
            title: Text("Payment",
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          ListTile(
            onTap: () {
              studentDB.updateStudentDrawerIndex(5);
              if (!kIsWeb) {
                context.popRoute();
              }
            },
            title: Text("Change Password",
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          ListTile(
            onTap: () {
              auth.logout(context);
            },
            title: Text("Logout",
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
