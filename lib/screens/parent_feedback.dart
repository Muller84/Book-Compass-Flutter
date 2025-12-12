import 'package:flutter/material.dart';
import 'package:book_compass_flutter/theme/app_theme.dart';
import 'package:book_compass_flutter/widgets/app_bottom_nav_bar.dart';

class ParentFeedback extends StatefulWidget {
  final Map<String, dynamic>? schoolClasses;
  const ParentFeedback({super.key, this.schoolClasses});

  @override
  State<ParentFeedback> createState() => _ParentFeedbackState(); // create state
}

class _ParentFeedbackState extends State<ParentFeedback> {
  // ignore: unused_field
  final int _currentIndex = 3; // 0 = Dashboard, 1 = Students, 2 = Library, 3 = Feedback

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
                ],
              ),

              const SizedBox(height: kSpacingMedium),

              Center(child: Text ('Reading Feedback',
              style: textTheme.titleLarge,
              ),
              ),
            ],
          ),
        ),
      ),


                  // Bottom navigation bar
                  bottomNavigationBar: AppBottomNavBar(
                    currentIndex: 3,
                    schoolClasses: widget.schoolClasses,
                      ),

              );
  }
}

                
