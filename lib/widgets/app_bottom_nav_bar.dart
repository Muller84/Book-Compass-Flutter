import 'package:flutter/material.dart';
import 'package:book_compass_flutter/screens/teacher_dashboard.dart';
import 'package:book_compass_flutter/screens/student_profile.dart';
import 'package:book_compass_flutter/screens/book_library.dart';
import 'package:book_compass_flutter/screens/parent_feedback.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex; // index of the currently selected bookmark

  const AppBottomNavBar({super.key, required this.currentIndex}); // constructor with mandatory index

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // sets the active bookmark
      type: BottomNavigationBarType.fixed, // all bookmarks are visible
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // background color according to theme
      onTap: (index) { // action when clicking on a bookmark
        if (index == 0 && currentIndex != 0) {
          Navigator.pushReplacement( // switches to TeacherDashboard
            context,
            MaterialPageRoute(
              builder: (context) => const TeacherDashboard(teacherName: 'Teacher'),
            ),
          );
        } else if (index == 1 && currentIndex != 1) {
          Navigator.pushReplacement( // switches to StudentProfile
            context,
            MaterialPageRoute(builder: (context) => const StudentProfile()),
          );
        } else if (index == 2 && currentIndex != 2) {
          Navigator.pushReplacement( // switches to BookLibrary
            context,
            MaterialPageRoute(builder: (context) => const BookLibrary()),
          );
        } else if (index == 3 && currentIndex != 3) {
          Navigator.pushReplacement( // switches to ParentFeedback
            context,
            MaterialPageRoute(builder: (context) => const ParentFeedback()),
          );
        }
      },
      // bookmarks
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Library'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Feedback'),
      ],
    );
  }
}