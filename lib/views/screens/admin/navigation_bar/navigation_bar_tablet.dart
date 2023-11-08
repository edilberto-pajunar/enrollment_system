import 'package:flutter/material.dart';
import 'package:web_school/views/widgets/drawer/admin_drawer.dart';
import 'package:web_school/views/widgets/app_bar/admin.dart';

class NavigationBarTablet extends StatelessWidget {
  const NavigationBarTablet({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AdminDrawer(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAdminAppBar(),
                child,
              ],
            ),
          ),
        ),

      ],
    );
  }
}
