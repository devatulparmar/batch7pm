import 'package:batch7pm/src/utils/const.dart';
import 'package:batch7pm/src/view/splash_screen/splash_screen.dart';
import 'package:batch7pm/src/view/stack_example/stack_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late SharedPreferences _preferences;

  void _getPreferenceData() async {
    _preferences = await SharedPreferences.getInstance();
    var token = _preferences.getString(prefLoginToken);
    print(token);
  }

  void _logOut() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.remove(prefIsLogin);
    Navigator.pushAndRemoveUntil(
      navigationGKey.currentContext!,
      MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    _getPreferenceData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _logOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreenWithStack(),
                  ),
                );
              },
              child: const Text('Login Screen With Stack'),
            ),
          ],
        ),
      ),
    );
  }
}
