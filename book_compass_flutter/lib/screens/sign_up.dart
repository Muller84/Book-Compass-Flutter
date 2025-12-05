import 'package:book_compass_flutter/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget{ 
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>{
  // Controllers for text fields   
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

              // Password Field
              TextField(
                controller: _passwordController,
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
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
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
       
   


