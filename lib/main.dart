import 'package:batch7pm/%20RadioButtonExample/radio_button_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyRadioScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2))),
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
                            label: Text('Password'),
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
      ),
    );
  }
}
