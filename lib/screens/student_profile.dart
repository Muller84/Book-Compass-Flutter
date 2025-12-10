import 'package:flutter/material.dart';
import 'package:book_compass_flutter/theme/app_theme.dart';
import 'package:book_compass_flutter/widgets/app_bottom_nav_bar.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key,});

  @override
  State<StudentProfile> createState() => _StudentProfileState(); // create state
}

class _StudentProfileState extends State<StudentProfile> {
  // ignore: unused_field
  final int _currentIndex = 1; // 0 = Dashboard, 1 = Students, 2 = Library, 3 = Feedback

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme; // get text from global theme

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kSpacingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: kLogoHeight,
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    child: Icon(Icons.person),
                  ), // Profile icon
                ],
              ),
              const SizedBox(height: kSpacingMedium),
              Center(child: Text('Student Profile Screen',
              style: textTheme.titleLarge,
              ),
              ),
            ],
          ),
        ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 1),
    );
  }
}


  