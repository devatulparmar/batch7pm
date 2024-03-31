import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickScreen extends StatefulWidget {
  const DatePickScreen({super.key});

  @override
  State<DatePickScreen> createState() => _DatePickScreenState();
}

class _DatePickScreenState extends State<DatePickScreen> {

  DateTime currentDate = DateTime.now();

  void showDate() async {
    var now = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(now.year, now.month, now.day + 15),
    );
    setState(() {
      currentDate = pickedDate!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Date: ${DateFormat('dd/MM/yyyy HH:mm:ss Z').format(DateTime.now())}'),
            ],
          ),

          Text('Date: ${currentDate.toLocal()}'),
          ElevatedButton(
            onPressed: () => showDate(),
            child: const Text('Date'),
          ),
        ],
      ),
    );
  }
}
