import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, widget) => MaterialApp.router(
        builder: (ctx, child) {
          ScreenUtil.init(ctx);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        theme: CustomTheme.themeData,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
