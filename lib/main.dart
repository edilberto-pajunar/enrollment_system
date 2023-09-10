import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:provider/provider.dart';
import 'package:web_school/firebase_options.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/application.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/networks/commons.dart';
import 'package:web_school/networks/instructor.dart';
import 'package:web_school/networks/router/routes.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/school_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCd7Jptmp-yQUGeYliCtyf33nnoq7B3INw",
          authDomain: "enrollment-8bef4.firebaseapp.com",
          databaseURL: "https://enrollment-8bef4-default-rtdb.firebaseio.com",
          projectId: "enrollment-8bef4",
          storageBucket: "enrollment-8bef4.appspot.com",
          messagingSenderId: "759159093073",
          appId: "1:759159093073:web:4b3ef60d86c3636099c570",
          measurementId: "G-LTWDS054WW"),
    );
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    if (Platform.isAndroid) PathProviderAndroid.registerWith();

    await StudentDB().initNotifications();
  }

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
        ChangeNotifierProvider<Application>(create: (context) => Application()),
        ChangeNotifierProvider<Auth>(create: (context) => Auth()),
        ChangeNotifierProvider<Commons>(create: (context) => Commons()),
        ChangeNotifierProvider<InstructorDB>(
            create: (context) => InstructorDB()),
        ChangeNotifierProvider<StudentDB>(create: (context) => StudentDB()),
      ],
      child: SchoolApp(
        appRouter: appRouter,
      ),
    );
  }
}
