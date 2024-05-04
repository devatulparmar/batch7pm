

import 'package:batch7pm/src/models/employee_model.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final EmployeeData employee;
  const ItemCard({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  "Employee Name : ${employee.employeeName}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Employee Salary : ${employee.employeeSalary}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Employee Age : ${employee.employeeAge}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Employee Image : ${employee.profileImage}",
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
    );
  }
}

