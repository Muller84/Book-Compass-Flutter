import 'package:flutter/material.dart';
import 'package:book_compass_flutter/screens/login_screen.dart';
import 'package:book_compass_flutter/theme/app_theme.dart';

class TeacherDashboard extends StatefulWidget { // stateful widget
  final String teacherName; // add field teacherName
  const TeacherDashboard({super.key, required this.teacherName}); 

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState(); // create state
}

class _TeacherDashboardState extends State<TeacherDashboard> { // state class
  int _currentIndex =
      0; // 0 = Dashboard, 1 = Students, 2 = Library, 3 = Feedback

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme; // get text from global theme

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
          child: Padding(
          padding: const EdgeInsets.all(24.0),
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

                  PopupMenuButton<String>(
                    icon: const CircleAvatar(
                      child: Icon(Icons.person),
                    ), // Profile icon

                    onSelected: (value) {
                      if (value == 'signout') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      }
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 'profile', child: Text('Profile')),
                      PopupMenuItem(value: 'settings', child: Text('Settings')),
                      PopupMenuItem(value: 'help', child: Text('Help')),
                      PopupMenuItem(value: 'signout', child: Text('Sign out')),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: kSpacingLarge),

              Text(
                'Hello, ${widget.teacherName}!',
                style: textTheme.titleLarge,
                ),

              const SizedBox(height: kSpacingSmall),

              Text(
                'Welcome to Book Compass',
                style: textTheme.bodyMedium,
              ),

              const SizedBox(height: kSpacingLarge),

              Text(
                'Select your next step:',
                style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),

              Expanded(
                child: Center(
                  child: Text(
                    _currentIndex == 0
                        ? 'Dashboard content'
                        : _currentIndex == 1
                        ? 'Profile content'
                        : _currentIndex == 2
                        ? 'Book Library Content'
                        : 'Parent Feedback content',
                    style: textTheme.titleLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(  context).scaffoldBackgroundColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Feedback'),
        ],
      ),
    );
  }
}
