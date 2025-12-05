import 'package:flutter/material.dart';
import 'sign_up.dart'; // Import SignUpScreen


class LoginScreen extends StatefulWidget{ const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  // Controllers for text fields   
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Condition of checkbox and password window  
  bool rememberMe = false; // checkbox state "Remember Me"
  bool obscurePassword = true; // Initially hide password (eye)


  @override
  Widget build(BuildContext context){
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
                height: 30,
              ),

              const SizedBox(height: 40),

              // Title
              const Text(
                'Sign In',
                style: TextStyle(
                  fontFamily: 'Teacher',
                  fontSize: 30,
                  letterSpacing: 2.0,
                ),
              ),

              const SizedBox(height: 20),

              // Email Field
              TextField(
                controller: _usernameController,
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

              const SizedBox(height: 8),

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
                  const Text('Remember Me'),
                ],
              ),

              const SizedBox(height: 15),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle sign in logic here/navigate to next screen
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Access Platform'),
                ),
              ),

              const SizedBox(height: 12),

              // Reset My Password
              Center(child: TextButton(
                onPressed: (){
                },
                  child: const Text('Reset My Password'),
              ),
              ),

              const Spacer(),

              // Sign up now 
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Not a member yet?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context
                            , MaterialPageRoute(builder: (context) => const SignUpScreen())
                        );
                        // Navigate to sign up screen
                      },
                      child: const Text ('Sign up now'),
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
          