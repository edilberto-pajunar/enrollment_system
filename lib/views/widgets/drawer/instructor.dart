import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/networks/instructor.dart';
import 'package:web_school/values/strings/images.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

class InstructorDrawer extends StatefulWidget {
  const InstructorDrawer({
    super.key,
  });

  @override
  State<InstructorDrawer> createState() => _InstructorDrawerState();
}

class _InstructorDrawerState extends State<InstructorDrawer> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final InstructorDB instructorDB = Provider.of<InstructorDB>(context, listen: false);
      final Auth auth = Provider.of<Auth>(context, listen: false);
      instructorDB.updateInstructorStream(auth.user!);
    });
  }

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);
    final InstructorDB instructorDB = Provider.of<InstructorDB>(context);
    final Auth auth = Provider.of<Auth>(context);

    return StreamWrapper<Instructor>(
      stream: instructorDB.instructorStream,
      child: (instructor) {
        return Drawer(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
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
                  instructorDB.updateDrawerIndex(0);
                  context.popRoute();
                },
                title: Text("Home",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  instructorDB.updateDrawerIndex(1);
                  context.popRoute();
                },
                title: Text("Profile",
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
    );
  }
}
