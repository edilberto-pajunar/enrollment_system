import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/values/strings/images.dart';

class InstructorDrawer extends StatelessWidget {
  const InstructorDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);
    final Auth auth = Provider.of<Auth>(context);

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
            onTap: () {},
            title: Text("Home",
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
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
}
