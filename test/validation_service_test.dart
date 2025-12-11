import 'package:flutter_test/flutter_test.dart';
import 'package:book_compass_flutter/services/validation_service.dart';   // uprav cestu

void main() {

  
  // Email Validation Tests
  group('Email Validation Tests', () {
    test('Valid email should return true', () {
      expect(ValidationService.isValidEmail('test@example.com'), true);
    });

    test('Email without @ should return false', () {
      expect(ValidationService.isValidEmail('testexample.com'), false);
    });

    test('Empty email should return false', () {
      expect(ValidationService.isValidEmail(''), false);
    });
  });


  // Password Validation Tests
  group('Password Validation Tests', () {
    test('Valid password returns null (success)', () {
      expect(ValidationService.validatePassword('abc123'), null);
    });

    test('Short password returns error message', () {
      expect(
        ValidationService.validatePassword('a12'),
        isNotNull,
      );
    });

    test('Password missing numbers returns error', () {
      expect(
        ValidationService.validatePassword('abcdef'),
        isNotNull,
      );
    });

    test('Password missing letters returns error', () {
      expect(
        ValidationService.validatePassword('123456'),
        isNotNull,
      );
    });

    test('Empty password returns error', () {
      expect(
        ValidationService.validatePassword(''),
        'Please enter a password.',
      );
    });
  });
}
