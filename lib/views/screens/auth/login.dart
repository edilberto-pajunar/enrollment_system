import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/values/strings/images.dart';
import 'package:web_school/views/widgets/buttons/primary.dart';
import 'package:web_school/views/widgets/fields/password.dart';
import 'package:web_school/views/widgets/fields/primary.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  static String route = "/login";
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final Auth auth = Provider.of<Auth>(context, listen: false);
  //     auth.updateAuthListStream();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ModalProgressHUD(
      inAsyncCall: auth.isLoading,
      child: Form(
        key: Auth.loginKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    PngImages.background,
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(height: 24.0),
                  // Text("Log in as ${auth.author}",
                  //   textAlign: TextAlign.center,
                  //   style: const TextStyle(
                  //     fontSize: 12.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  const SizedBox(height: 12.0),
                  Center(
                    child: PrimaryTextField(
                      fieldKey: Auth.emailKey,
                      label: "Control Number",
                      controller: Auth.controlNumber,
                      hintText: "Control Number",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  PasswordTextField(
                    fieldKey: Auth.passwordKey,
                    label: "Password",
                    controller: Auth.password,
                    hintText: "Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: height * 0.2),
                  PrimaryButton(
                    onPressed: () async {
                      if (Auth.loginKey.currentState!.validate()) {
                        auth.loginAccount(context);
                      }
                    },
                    label: "Login",
                  ),
                  TextButton(
                    onPressed: () {
                      context.popRoute();
                      auth.clearForm();
                    },
                    child: const Text("Return to main screen"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
    //   body: StreamWrapper<List<String>>(
    //       stream: auth.authListStream,
    //       child: (uids) {
    //         return ModalProgressHUD(
    //           inAsyncCall: auth.isLoading,
    //           child: Form(
    //             key: Auth.loginKey,
    //             child: Padding(
    //               padding: const EdgeInsets.all(24.0),
    //               child: SingleChildScrollView(
    //                 child: SizedBox(
    //                   height: MediaQuery.of(context).size.height,
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.stretch,
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Image.asset(
    //                         PngImages.background,
    //                         height: 120,
    //                         width: 120,
    //                       ),
    //                       const SizedBox(height: 24.0),
    //                       // Text("Log in as ${auth.author}",
    //                       //   textAlign: TextAlign.center,
    //                       //   style: const TextStyle(
    //                       //     fontSize: 12.0,
    //                       //     fontWeight: FontWeight.bold,
    //                       //   ),
    //                       // ),
    //                       const SizedBox(height: 12.0),
    //                       Center(
    //                         child: PrimaryTextField(
    //                           fieldKey: Auth.emailKey,
    //                           label: "Control Number",
    //                           controller: Auth.controlNumber,
    //                           hintText: "Control Number",
    //                           validator: (value) {
    //                             if (value == null || value.isEmpty) {
    //                               return "This field is required";
    //                             } else {
    //                               return null;
    //                             }
    //                           },
    //                         ),
    //                       ),
    //                       const SizedBox(height: 24.0),
    //                       PasswordTextField(
    //                         fieldKey: Auth.passwordKey,
    //                         label: "Password",
    //                         controller: Auth.password,
    //                         hintText: "Password",
    //                         validator: (value) {
    //                           if (value == null || value.isEmpty) {
    //                             return "This field is required";
    //                           } else {
    //                             return null;
    //                           }
    //                         },
    //                       ),
    //                       SizedBox(height: height * 0.2),
    //                       PrimaryButton(
    //                         onPressed: () async {
    //                           if (Auth.loginKey.currentState!.validate()) {
    //                             auth.loginAccount(context, uids!);
    //                           }
    //                         },
    //                         label: "Login",
    //                       ),
    //                       TextButton(
    //                         onPressed: () {
    //                           context.popRoute();
    //                           auth.clearForm();
    //                         },
    //                         child: const Text("Return to main screen"),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    //       }),
    // );
  }
}
