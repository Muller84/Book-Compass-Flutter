
import 'package:flutter/material.dart';
import 'package:book_compass_flutter/screens/login_screen.dart';

void main() {
  runApp(const BookCompassApp());
}

class BookCompassApp extends StatelessWidget {
  const BookCompassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Compass',
      theme: ThemeData(), //global theme
      home: const WelcomeScreen(
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        
        children: [
          const SizedBox(height: 40),
          Image.asset(
            'assets/images/logo.png', 
            height: 70,
            ), // Logo 

          const Spacer(),
          const Text(
            'Welcome',
              style: TextStyle(
                fontFamily: 'Teacher',
                fontSize: 60,
                letterSpacing: 5.0,
                ),
          ), // Welcome Text

          const SizedBox(
            width: 350,
            child: Text(
            'Book Compass: Your guide to the right story for every student.',
            textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Teacher',
                fontSize: 20,
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
                  builder: (context) => const LoginScreen()
                  ),
              );// Navigate to Login Screen
            },
            child: Image.asset(
              'assets/images/button_start.png',
              height: 40
              ), // Start Button Image
          ),

          const SizedBox(height: 40),
        ],
      ),
      ),
    );
  }
}
