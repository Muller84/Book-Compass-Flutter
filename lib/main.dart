import 'package:flutter/material.dart'; // Flutter widgets
import 'package:book_compass_flutter/screens/login_screen.dart'; // Login screen
import 'package:book_compass_flutter/theme/app_theme.dart'; // colors, style..

// Start app
void main() {
  runApp(const BookCompassApp());
}

class BookCompassApp extends StatefulWidget {
  const BookCompassApp({super.key});

  @override
  State<BookCompassApp> createState() => _BookCompassAppState();
}

class _BookCompassAppState extends State<BookCompassApp> {
  ThemeMode _themeMode = ThemeMode.light; // Current mode (default is light)

  // Toggles between light and dark mode according to the Switch value
  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    // main application shell, has both light and dark themes
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Compass',
      theme: appTheme, 
      darkTheme: ThemeData.dark(), // Dark mode
      themeMode: _themeMode, // switching between them
      home: WelcomeScreen(
        onThemeChanged: _toggleTheme, 
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  // Callback function from the main application to switch between light/dark mode
  final void Function(bool isDark) onThemeChanged;

  const WelcomeScreen({
    super.key,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Access current text styles from the theme (light/dark)
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // Allows content to be displayed below the AppBar (transparent effect)
      extendBodyBehindAppBar: true, 
      appBar: AppBar(
        backgroundColor: Colors.transparent, // transparent AppBar
        elevation: 0, // remove shadow
        toolbarHeight: 40, // AppBar height
        title: const SizedBox.shrink(), // no text

        actions: [
          Row(
            children: [
              const Icon(
                Icons.wb_sunny_outlined,
                size: 18,
                ),
              // Switcher for changing theme (light/dark)
              Padding(
                padding: const EdgeInsets.only(right: 5.0, top: 4.0),
                child: Transform.scale(
                scale: 0.6, 
                child: Switch(
                value: isDark,
                onChanged: onThemeChanged,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.nightlight_round,
              size: 18),
          )
        ],
      ),
      ],
      ),

      body: SafeArea(
  child: SingleChildScrollView( // enable scrolling, prevent overflow errors
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Application logo at the top left
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/logo.png',
              height: kLogoHeight,
            ),
          ),

          const SizedBox(height: 16),

          // Illustration image on the welcome screen
          Image.asset(
            'assets/images/welcome_image.png',
            height: 250,
          ),

          // Main welcome text
          Text(
            'Welcome',
            style: textTheme.headlineLarge?.copyWith(
              fontSize: 50,
              letterSpacing: 2.0,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Subtitle
          SizedBox(
            width: 350,
            child: Text(
              'Book Compass: Your guide to the right story for every student.',
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.0,
              ),
            ),
          ),

          const SizedBox(height: 32),

          // "Start" button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            child: Image.asset(
              'assets/images/button_start.png',
              height: 140, 
            ),
          ),
          
          const SizedBox(height: 24),
        ],
      ),
    ),
  ),
),
);
}
}
