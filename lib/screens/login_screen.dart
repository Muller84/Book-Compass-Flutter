import 'package:book_compass_flutter/screens/teacher_dashboard.dart';
import 'package:flutter/material.dart';
import 'sign_up.dart'; // Import SignUpScreen
import 'package:book_compass_flutter/theme/app_theme.dart';
import 'package:book_compass_flutter/widgets/custom_input_field.dart';
import 'package:book_compass_flutter/widgets/primary_button.dart';
import 'package:book_compass_flutter/services/validation_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState(); // create state
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers for text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Condition of checkbox and password window
  bool rememberMe = false; // checkbox state "Remember Me"
  bool obscurePassword = true; // Initially hide password (eye)

  void _handleLogin(BuildContext context) {
    final email = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    // Calling the validation service
    final passwordError = ValidationService.validatePassword(password);

    // Static validation checks
    if (!ValidationService.isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address'),
        ),
      );
      return;
    }

    if (passwordError != null) {
      ScaffoldMessenger.of(context,).
      showSnackBar(SnackBar(content: Text(passwordError)));
      return;
    }

    // Simulate successful login and navigate to TeacherDashboard
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TeacherDashboard(teacherName: 'Teacher'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme; // Access the global text theme

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kSpacingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Image.asset(
                'assets/images/logo.png', 
                height: kLogoHeight,
                ),

              const SizedBox(height: kSpacingLarge),

              // Title
              Text(
                'Sign In',
                style: textTheme.titleLarge,
                ),


              const SizedBox(height: kSpacingLarge),

              // Email Field (Využívá CustomInputField)
              CustomInputField(
                controller: _usernameController,
                labelText: 'EMAIL',
              ),

              const SizedBox(height: kSpacingMedium),

              // Password Field (Využívá CustomInputField)
              CustomInputField(
                controller: _passwordController,
                labelText: 'PASSWORD',
                isPassword: true,
                obscureText: obscurePassword,
                onToggleVisibility: (value) {
                  setState(() {
                    obscurePassword = value;
                  });
                },
              ),

              const SizedBox(height: kSpacingSmall),

              // Remember Me Checkbox
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        rememberMe = value ?? false;
                      });
                    },
                  ),
                  Text(
                    'Remember Me',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),


              const SizedBox(height: kSpacingMedium),

              // Sign In Button (PrimaryButton calls _handleLogin)
              PrimaryButton(
                text: 'Access Platform',
                onPressed: () => _handleLogin(context),
              ),

              const SizedBox(height: kSpacingMedium),

              // Reset My Password
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Reset My Password',
                    style: textTheme.bodyMedium?.copyWith(
                      color: kPrimaryGreen,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                ),
              ),

              const Spacer(),

              // Sign up now
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Not a member yet?',
                      style: textTheme.bodyMedium, // sekundary text style from global theme
                      ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign up now',
                        style: textTheme.bodyMedium?.copyWith(
                          color: kPrimaryGreen, // primary color from global theme
                          fontWeight: FontWeight.w600,
                        ),
                    ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
