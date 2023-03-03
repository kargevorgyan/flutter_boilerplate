import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../../custom_paint/background_paint.dart';
import '../../forms/auth_form.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/auth/auth_state.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final AuthState authState = GetIt.I<AuthState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(
                left: 24,
                top: 54,
              ),
              margin: const EdgeInsets.all(0),
              height: 188.5,
              color: Theme.of(context).sliderTheme.inactiveTrackColor,
              child: Column(
                children: [
                  SvgPicture.asset('assets/images/logo.svg'),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 69.5,
              child: CustomPaint(
                isComplex: true,
                painter: OpenPainter(
                  color: Theme.of(context).sliderTheme.inactiveTrackColor,
                ),
              ),
            ),
            const AuthForm(),
            RichText(
              text: TextSpan(
                text: 'Forgot password?',
                style: Theme.of(context).textTheme.subtitle2,
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await router.popAndPush(SplashScreenRoute());
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}