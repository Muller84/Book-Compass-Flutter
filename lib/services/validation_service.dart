// ValidationService.dart
class ValidationService {
  // Email validation rule
  static bool isValidEmail(String email) {
    if (email.isEmpty) return false;
    // simple email validation
    return email.contains('@');
  }

  // Password validation rule
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password.';
    }
    // password validation logic
    if (password.length < 6 ||
        !RegExp(r'[A-Za-z]').hasMatch(password) ||
        !RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must be at least 6 characters long and contain both letters and numbers.';
    }
    return null; // Validation succeeded
  }
}
