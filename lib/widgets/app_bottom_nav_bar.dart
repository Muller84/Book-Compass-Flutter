import 'package:flutter/material.dart';
import 'package:book_compass_flutter/screens/teacher_dashboard.dart';
import 'package:book_compass_flutter/screens/my_class_screen.dart';
import 'package:book_compass_flutter/screens/book_library.dart';
import 'package:book_compass_flutter/screens/parent_feedback.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex; // index of the currently selected bookmark
  final Map<String, dynamic>? schoolClasses;

  const AppBottomNavBar({
    super.key, 
    required this.currentIndex,
    this.schoolClasses,
    }); // constructor with mandatory index

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // sets the active bookmark
      type: BottomNavigationBarType.fixed, // all bookmarks are visible
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
       // background color according to theme
      onTap: (index) { // action when clicking on a bookmark
        if (index == 0 && currentIndex != 0) {
          Navigator.pushReplacement( // switches to TeacherDashboard
            context,
            MaterialPageRoute(
              builder: (context) => const TeacherDashboard(teacherName: 'Teacher'),
            ),
          );
        } else if (index == 1 && currentIndex != 1) {
          if (schoolClasses == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Class data is not available zet. Please try again.'),
                duration: Duration(seconds: 2),
                ),
                );
                return;
          }
          Navigator.push( // switches to StudentProfile
            context,
            MaterialPageRoute(
              builder: (context) => MyClassScreen(
                schoolClasses: schoolClasses!,
              )),
          );
        } else if (index == 2 && currentIndex != 2) {
          Navigator.push( // switches to BookLibrary
            context,
            MaterialPageRoute(
              builder: (context) => BookLibrary(
                schoolClasses: schoolClasses,
              )),
          );
        } else if (index == 3 && currentIndex != 3) {
          Navigator.push( // switches to ParentFeedback
            context,
            MaterialPageRoute(
              builder: (context) => ParentFeedback(
                schoolClasses: schoolClasses,
              )),
          );
        }
      },
      // bookmarks
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My class'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Library'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Feedback'),
      ],
    );
  }
}