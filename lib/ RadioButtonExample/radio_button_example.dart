import 'package:flutter/material.dart';

class MyRadioScreen extends StatefulWidget {
  const MyRadioScreen({super.key});

  @override
  State<MyRadioScreen> createState() => _MyRadioScreenState();
}

class _MyRadioScreenState extends State<MyRadioScreen> {
  int groupValue = 0;
  String dropdownValue = '';
  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
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
                child: DropdownMenu(
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
          Row(
            children: [
              Checkbox(
                value: checkBoxValue1,
                onChanged: (bool? value) {
                  setState(() {
                    checkBoxValue1 = value!;
                  });
                },
              ),
              const Text('Vadodara'),
              Checkbox(
                value: checkBoxValue2,
                onChanged: (bool? value) {
                  setState(() {
                    checkBoxValue2 = value!;
                  });
                },
              ),
              const Text('Baroda'),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  value: checkBoxValue2,
                  title: const Text('Vadodara'),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? value) {
                    setState(() {
                      checkBoxValue2 = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  value: checkBoxValue2,
                  title: const Text('Vadodara'),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? value) {
                    setState(() {
                      checkBoxValue2 = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  value: 0,
                  groupValue: groupValue,
                  title: const Text('Male'),
                  onChanged: (dynamic value) {
                    setState(() {
                      groupValue = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  value: 1,
                  groupValue: groupValue,
                  title: const Text('Female'),
                  onChanged: (dynamic value) {
                    setState(() {
                      groupValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
