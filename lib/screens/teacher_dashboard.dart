import 'package:flutter/material.dart'; // Flutter widgets
import 'package:book_compass_flutter/screens/login_screen.dart';
import 'package:book_compass_flutter/theme/app_theme.dart';
import 'package:book_compass_flutter/widgets/app_bottom_nav_bar.dart';
import 'package:book_compass_flutter/widgets/animated_book_covers.dart';
import 'package:book_compass_flutter/utils/data_loader.dart'; // dataset with students
import 'package:book_compass_flutter/screens/my_class_screen.dart';

class TeacherDashboard extends StatefulWidget { // stateful widget
  final String teacherName; // add field teacherName
  const TeacherDashboard({super.key, required this.teacherName}); 

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState(); // create state
}

class _TeacherDashboardState extends State<TeacherDashboard> { // state class
  // ignore: unused_field
  final int _currentIndex = 0; // 0 = Dashboard, 1 = Students, 2 = Library, 3 = Feedback

  // Variable to store the dataset loaded from the JSON file
  Map<String, dynamic>? _schoolDataset;

  @override
  void initState() {
    super.initState();
    // Load dataset at screen startup (asynchronously from assets/data/school dataset.json)
    loadSchoolDataset().then((data) {
      if (mounted) {
        // If the widget still exists, we save the data to the state
        setState(() {
          _schoolDataset = data;
        });
      }
    });
  }

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
                      child: Icon(Icons.person,
                      color: kTextSecondary),
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

              const SizedBox(height: kSpacingExtraLarge),

              Text(
                'Select your next step:',
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold
                  ),
              ),

              const SizedBox(height: kSpacingMedium),

              // Fast links
              Row(
                children: [
                  // "My Class" button – opens a screen with a list of classes and students
                  Expanded(child: ElevatedButton.icon(
                    onPressed: () {
                      if (_schoolDataset == null) return; // dataset not loaded yet
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyClassScreen(schoolClasses: _schoolDataset!),
                          ),
                          );
                          },
                          icon: Icon(Icons.group), // group icon
                          label: Text('My Class'))), // button text
                          
                          const SizedBox(width: 8), // space between buttons
                          
                          // "Book Tips" button – empty for now, ready for future functionality
                          Expanded(child: ElevatedButton.icon(
                            onPressed: () {}, // TODO: add logic
                            icon: Icon(Icons.lightbulb), // light bulb icon
                            label: Text('Book Tips'))),
                            
                            const SizedBox(width: 8), // space between buttons
                            
                            // "Feedback" button – empty for now
                            Expanded(child: ElevatedButton.icon(
                              onPressed: () {}, // TODO: add logic
                              icon: Icon(Icons.feedback), // feedback icon
                              label: Text('Feedback'))),
                              ],
                              ),
                              
                              const SizedBox(height: kSpacingSmall),
                              
                              // Animated book covers – decorative widget on the dashboard
                              const AnimatedBookCovers(),
            ],
          ),
        ),
      ),
      // Bottom navigation bar of the application
      // 0 active first tab (Dashboard)
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),

    );
  }
}
