import 'package:book_compass_flutter/screens/login_screen.dart';
import 'package:book_compass_flutter/screens/teacher_dashboard.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget{ 
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>{
  // Controllers for text fields 
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  // Condition of checkbox and password window  
  bool agreeToTerms = false; // checkbox state "Agree to Terms"
  bool obscurePassword = true; // Initially hide password (eye)


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(  24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo 
              Image.asset(
                'assets/images/logo.png', 
                height: 30,
              ),

              const SizedBox(height: 40),

              // Title
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Teacher',
                  fontSize: 30,
                  letterSpacing: 2.0,
                ),
              ),

              const SizedBox(height: 20),

              // Name Field
              TextField(controller: _nameController, decoration: const InputDecoration(
                labelText: 'NAME',
                border: OutlineInputBorder(),
              ),
              ),

              const SizedBox(height: 15),

              // Email Field
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'EMAIL',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              // Password Field
              TextField(
                controller: _passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Repeat Password Field
              TextField(
                controller: _repeatPasswordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: 'REPEAT PASSWORD',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Remember Me Checkbox 
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
                  // Remember Me Text
                  const Expanded(
                    child: Text(
                      'I have read and accept the Terms and Conditions',
                      ),
                      ),
                ],
              ),

              const SizedBox(height: 15),

              // Create Account Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Get input values
                    final name = _nameController.text.trim();
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();
                    final repeatPassword = _repeatPasswordController.text.trim();

                    // Simple validation rules
                    final emailValid = email.contains('@'); // Simple email validation
                    final passwordValid = // Simple password validation
                    password.length >= 6 &&
                    RegExp(r'[A-Za-z]').hasMatch(password) &&
                    RegExp(r'[0-9]').hasMatch(password);
                    
                    // Validations
                    if (email.isEmpty || password.isEmpty || repeatPassword.isEmpty) { // Empty field control
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter email and password fields') ),
                      );
                      return; 
                    }
                    // Email and Password validation
                    if (!emailValid) { // Email control
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a valid email address')),
                      );
                      return;
                    }
                    // Password control
                    if (!passwordValid) { // Password control
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Password must be at least 6 characters long and include both letters and numbers')),
                      );
                      return;
                    }
                    // Repeat Password control
                    if (password != repeatPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Passwords do not match')),
                      );
                      return;
                    }
                    // Terms and Conditions checkbox control
                    if (!agreeToTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('You must agree to the Terms and Conditions')),
                      );
                      return;
                    }
                  // If all validations pass, navigate to Teacher Dashboard
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                        builder: (context) => TeacherDashboard(
                          teacherName: name), // Pass teacherName to dashboard
                       ),
                  );
                  },
                 // Button Style
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  // Button Text
                  child: const Text('Create Account'),

                ),
              ),


              const Spacer(),

              // Sign in now 
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Are you member?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context
                            , MaterialPageRoute(builder: (context) => const LoginScreen())
                        );
                        // Navigate to sign up screen
                      },
                      child: const Text ('Sign in now'),
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
       
   


