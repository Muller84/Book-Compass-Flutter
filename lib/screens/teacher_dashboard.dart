import 'package:flutter/material.dart';
import 'package:book_compass_flutter/screens/login_screen.dart';

class TeacherDashboard extends StatefulWidget {
  final String teacherName;
  const TeacherDashboard({
    super.key,
    required this.teacherName,
  });

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}
class _TeacherDashboardState extends State<TeacherDashboard> {
  int _currentIndex = 0; // 0 = Dashboard, 1 = Students, 2 = Library, 3 = Feedback


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: 30,
                  ),
                  const Spacer(),
                  PopupMenuButton<String>(
                    icon: const CircleAvatar(
                      child: Icon(Icons.person),
                    ), // Profile icon

                    onSelected: (value) {
                      if (value =='signout') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      }
                      // TODO: handle actions
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(
                        value: 'profile',
                        child: Text('Profile'),
                      ),
                      PopupMenuItem(
                        value: 'settings',
                        child: Text('Settings'),
                      ),
                      PopupMenuItem(
                        value: 'help',
                        child: Text('Help'),
                      ),
                      PopupMenuItem(
                        value: 'signout',
                        child: Text('Sign out'),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Text(
                'Hello, ${widget.teacherName}!',
                style: const TextStyle(fontSize: 24),
              ),

              const SizedBox(height: 8),

              const Text(
                'Welcome to Book Compass',
                style: TextStyle(fontSize: 15),
              ),

              const SizedBox(height: 30),

              const Text(
                'Select your next step:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
              style: const TextStyle(fontSize: 20),
              ),
                ),
              ),
            ],
          ),
        ),
      ),
      // spodní menu bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Feedback',
          ),
        ],
      ),
    );
  }
}