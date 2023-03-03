import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/auth/auth_state.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final AuthState authState = GetIt.I<AuthState>();

  int currentTabIndex = 1;
  bool isLogin = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 82,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    child: !isLogin
                        ? TextFormField(
                      controller: emailController,
                      validator: (value) => (value == null ||
                          value.isEmpty)
                          ? 'Please enter an email address.'
                          : EmailValidator.validate(value)
                          ? null
                          : 'Please enter a valid email address.',
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: 'Email',
                      ),
                    )
                        : const SizedBox(
                      height: 48,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    child: TextFormField(
                      controller: usernameController,
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Please enter username.'
                          : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 32,
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (value) =>
                          authState.validatePassword(value!),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 40,
          ),
          child: SizedBox(
            child: CustomSlidingSegmentedControl(
              initialValue: currentTabIndex,
              isStretch: true,
              innerPadding: EdgeInsets.zero,
              children: {
                1: Text(
                  'Login',
                  style: TextStyle(
                    color: isLogin
                        ? Colors.white
                        : Theme.of(context).hintColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                2: Text(
                  'Sign-up',
                  style: TextStyle(
                    color: !isLogin
                        ? Colors.white
                        : Theme.of(context).hintColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              },
              decoration: BoxDecoration(
                color: Theme.of(context).sliderTheme.inactiveTrackColor,
                borderRadius: BorderRadius.circular(20),
              ),
              thumbDecoration: BoxDecoration(
                color: Theme.of(context).sliderTheme.activeTrackColor,
                borderRadius: BorderRadius.circular(20),
              ),
              onValueChanged: (int tabIndex) async {
                if (tabIndex == currentTabIndex) {
                  if (_formKey.currentState!.validate()) {
                    if (tabIndex == 1) {
                      final data = {
                        'username': usernameController.text,
                        'password': passwordController.text,
                      };

                      await authState
                          .login(data)
                          .then(
                            (value) async => {
                          _formKey.currentState?.reset(),
                          await router.popAndPush(SplashScreenRoute())
                        },
                      )
                          .catchError(
                            (er) => {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${er}'),
                              backgroundColor: Colors.red,
                            ),
                          )
                        },
                      );
                    } else {
                      final data = {
                        'id': const Uuid().v1(),
                        'email': emailController.text,
                        'username': usernameController.text,
                        'password': passwordController.text,
                      };

                      await authState
                          .signUp(data)
                          .then(
                            (value) async => {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(value),
                              backgroundColor: Colors.green,
                            ),
                          ),
                          _formKey.currentState?.reset(),
                          await router.popAndPush(const AuthRoute())
                        },
                      )
                          .catchError(
                            (er) => {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${er}'),
                              backgroundColor: Colors.red,
                            ),
                          )
                        },
                      );
                    }
                  }
                } else {
                  _formKey.currentState?.reset();
                }
                if (mounted) {
                  setState(() {
                    currentTabIndex = tabIndex;
                    isLogin = tabIndex == 1;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
