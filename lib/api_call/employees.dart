import 'dart:convert';

import 'package:batch7pm/models/employee_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  List<EmployeeData> employeeList = [];
  List tempList = [];

  Future<List<EmployeeData>> _getEmployeeData() async {
    var response = await http.get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));
    try{
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonDecodedData = jsonDecode(response.body);
        tempList.clear();
        employeeList.clear();
        tempList = jsonDecodedData['data'] as List;
        employeeList = tempList.map((item) => EmployeeData.fromJson(item)).toList();
        setState(() {});
      } else {
        debugPrint('Error ${response.statusCode}');
      }
    } catch (e){
      debugPrint('Error at _getEmployeeData() :: $e');
    }
    return employeeList;
  }

  @override
  void initState() {
    super.initState();
    _getEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: employeeList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.blue.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Employee Name : ${employeeList[index].employeeName}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Employee Salary : ${employeeList[index].employeeSalary}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Employee Age : ${employeeList[index].employeeAge}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
