import 'package:flutter/material.dart';
import 'package:book_compass_flutter/theme/app_theme.dart';
import 'package:book_compass_flutter/widgets/app_bottom_nav_bar.dart';

class MyClassScreen extends StatelessWidget {
  final Map<String, dynamic> schoolClasses;

  const MyClassScreen({super.key, required this.schoolClasses});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // logo nahoře
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: kLogoHeight,
                  ),
                ],
              ),

              const SizedBox(height: kSpacingMedium),

              // nadpis uprostřed
              Center(
                child: Text(
                  'My Class',
                  style: textTheme.titleLarge,
                ),
              ),

              const SizedBox(height: kSpacingMedium),

              // obsah – seznam tříd a studentů
              Expanded(
                child: ListView(
                  children: schoolClasses.entries.map((entry) {
                    final className = entry.key;
                    final students = entry.value as List<dynamic>;

                    return ExpansionTile(
                      title: Text(
                        className,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: students.map((child) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                contentPadding: const EdgeInsets.all(12),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(child["avatar"]),
                                ),
                                title: Text(
                                  child["name"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text("Age: ${child["age"]}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16, 0, 16, 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Interests:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Wrap(
                                      spacing: 6,
                                      runSpacing: -6,
                                      children: (child["interests"]
                                              as List<dynamic>)
                                          .map((interest) {
                                        return Chip(
                                          label: Text(
                                            interest,
                                            style: const TextStyle(
                                                fontSize: 12),
                                          ),
                                          backgroundColor:
                                              Colors.grey.shade100,
                                          visualDensity:
                                              VisualDensity.compact,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 1),
    );
  }
}
