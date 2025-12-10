import 'package:flutter/material.dart';
import 'package:book_compass_flutter/screens/teacher_dashboard.dart';
import 'package:book_compass_flutter/screens/student_profile.dart';
import 'package:book_compass_flutter/screens/book_library.dart';
import 'package:book_compass_flutter/screens/parent_feedback.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const AppBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      onTap: (index) {
        if (index == 0 && currentIndex != 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const TeacherDashboard(teacherName: 'Teacher'),
            ),
          );
        } else if (index == 1 && currentIndex != 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const StudentProfile()),
          );
        } else if (index == 2 && currentIndex != 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BookLibrary()),
          );
        } else if (index == 3 && currentIndex != 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ParentFeedback()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Library'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Feedback'),
      ],
    );
  }
}