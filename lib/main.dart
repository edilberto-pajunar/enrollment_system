import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/firebase_options.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/application.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/networks/commons.dart';
import 'package:web_school/networks/router/routes.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/school_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AdminDB>(create: (context) => AdminDB()),
        ChangeNotifierProvider<Auth>(create: (context) => Auth()),
        ChangeNotifierProvider<Application>(create: (context) => Application()),
        ChangeNotifierProvider<Commons>(create: (context) => Commons()),
        ChangeNotifierProvider<StudentDB>(create: (context) => StudentDB()),
      ],
      child: SchoolApp(
        appRouter: appRouter,
      ),
    );
  }
}
