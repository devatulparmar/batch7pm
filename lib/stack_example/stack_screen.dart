import 'package:flutter/material.dart';

class LoginScreenWithStack extends StatefulWidget {
  const LoginScreenWithStack({super.key});

  @override
  State<LoginScreenWithStack> createState() => _LoginScreenWithStackState();
}

class _LoginScreenWithStackState extends State<LoginScreenWithStack> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color(0xfff60069),
                  Color(0xff5b0060),
                  Color(0xff870160),
                  Color(0xffac255e),
                  Color(0xffca485c),
                  Color(0xffe16b5c),
                  Color(0xfff39060),
                  Color(0xffffb56b),
                ], // Gradient from https://learnui.design/tools/gradient-generator.html
                tileMode: TileMode.mirror,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
                      child: Column(
                        children: [
                          TextField(
                            controller: _controller,
                            onChanged: (value) {
                              setState(() {
                                debugPrint(value);
                              });
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black, width: 2))),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _passController,
                            obscureText: isObscureText,
                            maxLength: 8,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                debugPrint(value);
                              });
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
                                  color: isObscureText ? Colors.grey : Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
