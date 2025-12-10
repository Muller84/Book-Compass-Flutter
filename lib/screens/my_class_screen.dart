import 'package:flutter/material.dart';

class MyClassScreen extends StatelessWidget {
  final Map<String, dynamic> schoolClasses;

  const MyClassScreen({super.key, required this.schoolClasses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Class")),
      body: ListView(
        children: schoolClasses.entries.map((entry) {
          final className = entry.key;
          final students = entry.value as List<dynamic>;

          return ExpansionTile(
            title: Text(
              className,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: students.map((child) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(child["avatar"]),
                ),
                title: Text(child["name"]),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Age: ${child["age"]}"),
                    Wrap(
                      spacing: 6,
                      children: (child["interests"] as List<dynamic>)
                          .map((interest) => Chip(label: Text(interest)))
                          .toList(),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}