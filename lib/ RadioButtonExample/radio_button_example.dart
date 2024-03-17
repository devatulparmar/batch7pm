import 'package:flutter/material.dart';

class MyRadioScreen extends StatefulWidget {
  const MyRadioScreen({super.key});

  @override
  State<MyRadioScreen> createState() => _MyRadioScreenState();
}

class _MyRadioScreenState extends State<MyRadioScreen> {
  int groupValue = 3;
  String dropdownValue = '';
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  @override
  void initState() {
    super.initState();
    // dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Radio(
                value: 0,
                groupValue: groupValue,
                onChanged: (dynamic value) {
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
              const Text('Male'),
              Radio(
                value: 1,
                groupValue: groupValue,
                onChanged: (dynamic value) {
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
              const Text('Female'),
            ],
          ),

          Row(
            children: [
              Expanded(
                flex: 1,
                child: DropdownMenu<String>(
                  // initialSelection: list.first,
                  hintText: 'Select',
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  dropdownMenuEntries: list.map((String value) {
                    return DropdownMenuEntry(value: value, label: value);
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
