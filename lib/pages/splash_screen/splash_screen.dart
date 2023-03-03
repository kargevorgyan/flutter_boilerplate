import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../store/auth/auth_state.dart';
import '../../utils/storage_utils.dart';

class SplashScreenPage extends HookWidget {
  SplashScreenPage({Key? key}) : super(key: key);

  final AuthState authState = GetIt.I<AuthState>();

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        checkSession();
        return;
      },
    );
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 200,
          width: 200,
        ),
      ),
    );
  }

  Future<void> checkSession() async {
    final _token = await StorageUtils.getAccessToken();

    if (_token == null) {
      await router.popAndPush(const AuthRoute());
    } else {
      await authState.setCurrentUser();
      await router.popAndPush(const DashboardRoute());
    }
  }
}
