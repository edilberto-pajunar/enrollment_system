import 'package:flutter/material.dart';
import 'package:web_school/networks/router/go_route.dart';
import 'package:web_school/networks/router/routes.dart';
import 'package:web_school/values/theme.dart';

class SchoolApp extends StatelessWidget {
  const SchoolApp({
    required this.appRouter,
    super.key,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {

    final _route = CustomRouter();

    return MaterialApp.router(
      theme: CustomTheme.themeData,
      routerConfig: _route.router,
    );
  }
}
