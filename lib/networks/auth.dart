import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_school/models/user.dart';
import 'package:web_school/views/screens/admin/home.dart';
import 'package:web_school/views/screens/responsive/layout.dart';
import 'package:web_school/views/screens/responsive/student.dart';

class Auth extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  bool isLoading = false;

  /// [showHUD] will trigger to show the waiting widget
  void showHUD(bool value) {
    isLoading = value;
    notifyListeners();
  }

  static TextEditingController controlNumber = TextEditingController();
  static TextEditingController password = TextEditingController();

  static GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  static GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();

  String? author;

  /// [updateAuthor] will update whether
  /// the user is instructor, student or admin
  void updateAuthor(String? value) {
    author = value;
    notifyListeners();
  }

  UserModel? user;

  /// [loginAccount] will prompt the user to log in
  Future<UserCredential?> loginAccount(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    showHUD(true);

    db.collection("user").get().then((value) {
      try {
        final List<UserModel> userModels = value.docs.map((doc) {
          final data = doc.data();

          return UserModel.fromJson(data);
        }).toList();

        userModels.forEach((userModel) {

          if (userModel.controlNumber == controlNumber.text && userModel.password == password.text) {
            if (userModel.type == "instructor") {
              user = userModel;
              // context.pushRoute(InstructorHomeRoute(
              //   userModel: userModel
              // ));
            } else if (userModel.type == "student") {
              user = userModel;
              context.go(StudentLayoutBuilder.route,
                extra: userModel,
              );
            } else if (userModel.type == "admin") {
              user = userModel;
              context.go(AdminHomeScreen.route,
                extra: userModel,
              );
            }
          }


          notifyListeners();

        });

        showHUD(false);
      } catch (e) {
        showHUD(false);

        print(e);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                "Wrong control number/password.",
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.red,
                ),
              ),
            );
          });
      }
    });
    return null;
    // try {
    //   UserCredential userCredential = await auth
    //       .signInWithEmailAndPassword(
    //     email: "${controlNumber.text}@gmail.com",
    //     password: password.text,
    //   )
    //       .then((UserCredential value) {
    //     if (uids.contains(value.user!.uid)) {
    //       // Update the user model
    //       // user = UserModel(
    //       //   controlNumber: controlNumber.text,
    //       //   type: author!,
    //       //   id: value.user!.uid,
    //       // );
    //
    //       if (author == "instructor") {
    //         context.pushRoute(const InstructorHomeRoute());
    //       } else if (author == "student") {
    //         context.pushRoute(const StudentLayoutBuilder());
    //       } else if (author == "admin") {
    //         context.pushRoute(const AdminHomeRoute());
    //       }
    //       notifyListeners();
    //     } else {
    //       showDialog(
    //           context: context,
    //           builder: (context) {
    //             return AlertDialog(
    //               content: Text(
    //                 "Wrong control number/password.",
    //                 style: theme.textTheme.bodyMedium!.copyWith(
    //                   color: Colors.red,
    //                 ),
    //               ),
    //             );
    //           });
    //     }
    //     return value;
    //   });
    //
    //   showHUD(false);
    //   return userCredential;
    // } catch (e) {
    //   showHUD(false);
    //   Future.delayed(Duration.zero, () {
    //     showDialog(
    //         context: context,
    //         builder: (context) {
    //           return AlertDialog(
    //             content: Text(
    //               "Wrong control number/password.",
    //               style: theme.textTheme.bodyMedium!.copyWith(
    //                 color: Colors.red,
    //               ),
    //             ),
    //           );
    //         });
    //   });
    //   throw "Error: $e";
    // }
  }

  /// [logOut] lets the user logout and clear the
  /// credentials
  Future<void> logout(BuildContext context) async {
    await auth.signOut().then((value) {
      context.go(ResponsiveBuilder.route);
      // context.router.popUntilRoot();
      // AutoRouter.of(context).replace(const ResponsiveBuilder());
      clearForm();
    });
  }

  void clearForm() {
    controlNumber.clear();
    password.clear();
    notifyListeners();
  }

  Stream<List<String>>? authListStream;

  Stream<List<String>> getAuth() {
    return db.collection(author!).snapshots().map(_authFromSnapshots);
  }

  List<String> _authFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      if (author == "student") {
        final data = doc.data() as Map<String, dynamic>;
        return data["studentInfo"]["id"] as String;
      } else {
        return doc.get("id") as String;
      }
    }).toList();
  }

  void updateAuthListStream() {
    authListStream = getAuth();
    notifyListeners();
  }
}
