import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/values/strings/images.dart';
import 'package:web_school/views/widgets/buttons/primary.dart';
import 'package:web_school/views/widgets/fields/password.dart';
import 'package:web_school/views/widgets/fields/primary.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>(debugLabel: "loginKey");

  final GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>(debugLabel: "emailKey");
  final GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>(debugLabel: "passwordKey");


  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Form(
          key: loginKey,
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          PngImages.background,
                          height: 120,
                          width: 120,
                        ),
                        const SizedBox(height: 24.0),
                        Text("St.Jude Agro Industrial Secondary School",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text("Topas Proper Nabua, Camarines Sur",
                          style: theme.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24.0),
                        SizedBox(
                          width: size.width * 0.5,
                          child: PrimaryTextField(
                            fieldKey: emailKey,
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
                        const SizedBox(height: 12.0),
                        SizedBox(
                          width: size.width * 0.5,
                          child: PasswordTextField(
                            fieldKey: passwordKey,
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
                        ),
                        const SizedBox(height: 24.0),
                        SizedBox(
                          width: size.width * 0.5,
                          child: PrimaryButton(
                            onPressed: () async {
                              if (loginKey.currentState!.validate()) {
                                auth.loginAccount(context);
                              }
                            },
                            label: "Login",
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        TextButton(
                          onPressed: () {
                            context.router.pushNamed("/");
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
        ),
      ),
    );
  }
}
