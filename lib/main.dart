import 'package:flutter/material.dart';
import 'package:book_compass_flutter/screens/login_screen.dart';
import 'package:book_compass_flutter/theme/app_theme.dart';

void main() {
  runApp(const BookCompassApp());
}

class BookCompassApp extends StatelessWidget {
  const BookCompassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Compass',
      theme: appTheme, // Apply the global theme
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme; // Access the global text theme

    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: Image.asset(
                'assets/images/logo.png',
                height: kLogoHeight, // global constant for logo height
              ), // Logo Image
            ),
          ),

          Image.asset(
            'assets/images/welcome_image.png', 
            height: 250,
            ), // Welcome Image

            const SizedBox(height: 16),

          Text(
            'Welcome',
            style: textTheme.headlineLarge?.copyWith(
              fontSize: 60, // bigger font than deffault headlineLarge
              letterSpacing: 2.0,
            ),
          ), // Welcome Text

          const SizedBox(height: 16),

          SizedBox(
            width: 350,
            child: Text(
              'Book Compass: Your guide to the right story for every student.',
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith( // main body text style from global theme
                fontSize: 18,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.0,
              ),
            ),
          ), // Subtitle Text

          const Spacer(),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen()),
              ); // Navigate to Login Screen
            },
            child: Image.asset(
              'assets/images/button_start.png',
              height: 160,
            ), // Start Button Image
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
