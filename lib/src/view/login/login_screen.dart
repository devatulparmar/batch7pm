import 'dart:convert';

import 'package:batch7pm/src/repository/api_repository.dart';
import 'package:batch7pm/src/utils/const.dart';
import 'package:batch7pm/src/utils/global_functions.dart';
import 'package:batch7pm/src/view/landing_page/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/urls.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late SharedPreferences _preferences;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isObscureText = true;
  bool isLoading = false;

  Future _loginAPICall() async {
    setState(() {
      isLoading = true;
    });
    Response response = await ApiRepository().defaultPostCall(
      loginURL,
      {
        'contentType': 'Application/json',
      },
      {"email": "eve.holt@reqres.in", "password": "cityslicka"},
      // {
      //   "email": _controller.text,
      //   "password": _passController.text,
      // },
    );
    try {
      if (response.statusCode == successStatusCode) {
        debugPrint('Success!');
        var data = jsonDecode(response.body);
        debugPrint(data['token'].toString());
        _preferences = await SharedPreferences.getInstance();
        _preferences.setString(prefLoginToken, data['token'].toString());
        _preferences.setBool(prefIsLogin, true);
        _controller.text = '';
        _passController.text = '';
        Navigator.pushReplacement(
          navigationGKey.currentContext!,
          MaterialPageRoute(
            builder: (_) => const LandingScreen(),
          ),
        );
      } else if (response.statusCode == 500) {
        debugPrint('API wale ki galti');
      } else {
        debugPrint('Error ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error at _loginAPICall() :: $e');
    }
    setState(() {
      isLoading = false;
    });
  }

  bool _isValidate() {
    if (_controller.text.isEmpty) {
      return false;
    } else if (_passController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Email'),
                    SizedBox(height: 50),
                    Text('Password'),
                  ],
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _controller,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the email';
                            } else if (!AppGlobalFunctions()
                                .isEmail(_controller.text)) {
                              return 'Please enter valid email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _passController,
                          obscureText: isObscureText,
                          maxLength: 8,
                          keyboardType: TextInputType.text,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            // prefixIcon: Icon(Icons.lock),
                            label: const Text('Password'),
                            // hintText: 'Enter password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              icon: Icon(
                                Icons.remove_red_eye,
                                color:
                                    isObscureText ? Colors.grey : Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  // if (_formKey.currentState!.validate()) {
                  //    _loginAPICall();
                  // }
                  _loginAPICall();

                  /// custom function
                  // if (_isValidate()) {
                  //   _loginAPICall();
                  // }
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
