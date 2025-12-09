import 'package:book_compass_flutter/screens/login_screen.dart'; // for navigation back to login
import 'package:book_compass_flutter/screens/teacher_dashboard.dart'; // for navigation after sign up
import 'package:book_compass_flutter/theme/app_theme.dart'; // for global constants
import 'package:flutter/material.dart'; // Flutter material package
import 'package:book_compass_flutter/widgets/custom_input_field.dart'; // custom input field widget
import 'package:book_compass_flutter/widgets/primary_button.dart'; // custom primary button widget
import 'package:book_compass_flutter/services/validation_service.dart'; // validation service

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =TextEditingController();

  // Condition of checkbox and password window
  bool agreeToTerms = false; // checkbox state "Agree to Terms"
  bool obscurePassword = true; // Initially hide password (eye)

  void _handleSignUp(BuildContext context) {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final repeatPassword = _repeatPasswordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        repeatPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }
    if (!ValidationService.isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address.'),
        ),
      );
      return;
    }

    final passwordError = ValidationService.validatePassword(password);
    if (passwordError != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(passwordError)));
      return;
    }

    if (password != repeatPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match.')));
      return;
    }

    if (!agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You must agree to the terms and conditions.'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            TeacherDashboard(teacherName: name), // teacherName from input
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme; // Access the global text theme

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Image.asset(
                'assets/images/logo.png', 
                height: kLogoHeight, // global constant for logo height
                ),

              const SizedBox(height: kSpacingLarge),

              // Title
              Text( 
                'Sign Up',
                style: textTheme.titleLarge,
                ),
                
                const SizedBox(height: kSpacingLarge), // Spacing between title and fields

              // Name Field (CustomInputField)
              CustomInputField(
                controller: _nameController, 
                labelText: 'NAME'),

              const SizedBox(height: kSpacingMedium),

              // Email Field (CustomInputField)
              CustomInputField(
                controller: _emailController,
                labelText: 'EMAIL',
              ),

              const SizedBox(height: kSpacingMedium),

              // Password Field (CustomInputField with hide/show logic)
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

              const SizedBox(height: kSpacingMedium),

              // Repeat Password Field (CustomInputField with hide/show logic)
              CustomInputField(
                controller: _repeatPasswordController,
                labelText: 'REPEAT PASSWORD',
                isPassword: true,
                obscureText: obscurePassword,
                onToggleVisibility: (value) {
                  setState(() {
                    obscurePassword = value;
                  });
                },
              ),
              
              const SizedBox(height: kSpacingMedium),

              // Checkbox
              Row(
                children: [
                  Checkbox(
                    value: agreeToTerms,
                    onChanged: (bool? value) {
                      setState(() {
                        agreeToTerms = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      'I have read and accept the Terms and Conditions',
                      style: textTheme.bodyMedium, // sekundary text style from global theme
                    ),
                  ),
                ],
              ),

              const SizedBox(height: kSpacingMedium),

              // Create Account Button (PrimaryButton, calls _handleSignUp)
              PrimaryButton(
                text: 'Create Account',
                onPressed: () => _handleSignUp(context),
              ),

              const Spacer(),

              // Sign in now
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Are you member?',
                      style: textTheme.bodyMedium, // sekundary text style from global theme
                      ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign in now',
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
