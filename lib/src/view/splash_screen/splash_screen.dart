import 'dart:async';

import 'package:batch7pm/src/utils/const.dart';
import 'package:batch7pm/src/view/landing_page/landing_screen.dart';
import 'package:batch7pm/src/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  int _start = 2;
  late SharedPreferences _preferences;

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
          navigateToNextScreen();
        }
        else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void navigateToNextScreen() async {
    _preferences = await SharedPreferences.getInstance();
    bool isLogin = _preferences.getBool(prefIsLogin) ?? false;
    Navigator.pushReplacement(
      navigationGKey.currentContext!,
      MaterialPageRoute(
        builder: (_) => isLogin ? const LandingScreen() : const LoginScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/presentation.png',
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}
