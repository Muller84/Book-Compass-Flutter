import 'dart:math';

import 'package:flutter/material.dart';
import 'package:book_compass_flutter/screens/login_screen.dart';
import 'package:book_compass_flutter/theme/app_theme.dart';
import 'package:book_compass_flutter/widgets/app_bottom_nav_bar.dart';
import 'package:book_compass_flutter/widgets/animated_book_covers.dart';
import 'package:book_compass_flutter/utils/data_loader.dart';

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

  // dataset for classes
  Map<String, dynamic>? _schoolDataset;

  // dataset for books
  List<dynamic>? _books;

  // random number generator for selecting one book
  final Random _random = Random();

  // saves a specific selected book
  Map<String, dynamic>? _selectedBookTip; 

  @override
  void initState() {
    super.initState();

    // loading the school dataset
    loadSchoolDataset().then((data) {
      if (!mounted) return;
      setState(() {
        _schoolDataset = data;
      });
    });

    // loading the book dataset
    loadBooksDataset().then((data) {
      if (!mounted) return;
      setState(() {
        _books = data;
      });
    });
  }

  // the function checks if the books are loaded and the list is not empty
  void _showRandomBookTip() {
  if (_books == null || _books!.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Book data not loaded yet.')),
    );
    return;
  }

  setState(() {
    if (_selectedBookTip == null) {
      _selectedBookTip = _books![_random.nextInt(_books!.length)];
    } else {
      _selectedBookTip = null;
    }
  });
}

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // WHEN `_schoolDataset` IS STILL NULL → loader
    if (_schoolDataset == null) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const Center(
        child: CircularProgressIndicator(),
      ),
      bottomNavigationBar: const AppBottomNavBar(
        currentIndex: 0,
      ),
    );
  }

    // HOWEVER `_schoolDataset` IS LOADED → original UI
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
                      child: Icon(
                        Icons.person,
                        color: Color.fromRGBO(67, 93, 48, 1),
                      ),
                    ),
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
                      PopupMenuItem(
                          value: 'profile', child: Text('Profile')),
                      PopupMenuItem(
                          value: 'settings', child: Text('Settings')),
                      PopupMenuItem(value: 'help', child: Text('Help')),
                      PopupMenuItem(
                          value: 'signout', child: Text('Sign out')),
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
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: kSpacingMedium),

              // Fast links
              Row(
                children: [
                  // Book Tips – from books.json
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _showRandomBookTip,
                      icon: const Icon(Icons.lightbulb),
                      label: const Text('Book Tips'),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Feedback 
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No new feedback yet'),
                            duration: Duration(seconds: 2),
                            ),
                            );
                      },
                      icon: const Icon(Icons.feedback),
                      label: const Text('Feedback'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: kSpacingSmall),

            // If we already have a selected book tip in memory (_selectedBookTip is not null),
            // draw a special box (Container) with the book details below the buttons.
            if (_selectedBookTip != null)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedBookTip = null; // zavřít kartu po kliku
                });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(top: kSpacingSmall, bottom: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selectedBookTip!['title'] ?? 'Book tip',
                    style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                ),
              ),
                  const SizedBox(height: 4),
                  Text(
                    'Level ${_selectedBookTip!['level']}, ${_selectedBookTip!['category']}',
                    style: textTheme.bodySmall,
                  ),
              ],
             ),
          ),
        ),


              const AnimatedBookCovers(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: 0,
        schoolClasses: _schoolDataset,
        ),
    );
  }
}
