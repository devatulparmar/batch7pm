import 'dart:convert';

import 'package:batch7pm/src/models/employee_model.dart';
import 'package:batch7pm/src/utils/const.dart';
import 'package:batch7pm/src/utils/urls.dart';
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
  bool isLoading = false;

  Future<List<EmployeeData>> _getEmployeeData() async {
    setState(() {
      isLoading = true;
    });
    var response = await http.get(Uri.parse(getEmployeeURL));
    try {
      if (response.statusCode == successStatusCode) {
        Map<String, dynamic> jsonDecodedData = jsonDecode(response.body);
        tempList.clear();
        employeeList.clear();
        tempList = jsonDecodedData['data'] as List;
        employeeList =
            tempList.map((item) => EmployeeData.fromJson(item)).toList();
        setState(() {});
        debugPrint('data :: $tempList');
      } else if (response.statusCode == 500) {
        debugPrint('API wale ki galti');
      } else {
        debugPrint('Error ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error at _getEmployeeData() :: $e');
    }
    setState(() {
      isLoading = false;
    });
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.pink),)
          : ListView.builder(
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
                              Text(
                                "Employee Image : ${employeeList[index].profileImage}",
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
