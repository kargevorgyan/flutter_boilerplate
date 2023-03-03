import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/auth/auth_state.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final AuthState authState = GetIt.I<AuthState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(
                builder: (_) => Column(
                  children: [
                    const Text(
                      'User Email',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      '${authState.currentUser?.email}',
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    await authState.logout();
                    await router.popAndPush(SplashScreenRoute());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(26, 92, 255, 1),
                    foregroundColor: const Color.fromRGBO(26, 92, 255, 1),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
