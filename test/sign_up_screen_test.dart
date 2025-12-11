import 'package:flutter/material.dart'; // Imports basic widgets and themes.
import 'package:flutter_test/flutter_test.dart'; // Imports widget testing tools.
import 'package:book_compass_flutter/screens/sign_up.dart'; // Imports the tested signup screen (SignUpScreen).

// Widget test, tests the user registration component (SignUpScreen).
void main() {

  // Test suite: Verifies the presence and correct naming of all key UI elements.
  testWidgets('All input fields and button are present', (WidgetTester tester) async {
    // 1. Render (pump) the test screen.
    // It embeds SignUpScreen into MaterialApp, which is necessary for widgets to function properly.
    await tester.pumpWidget(const MaterialApp(home: SignUpScreen())); 

    // 2. UI Stabilization
    // Waits for all animations and asynchronous operations (e.g. data loading) to complete.
    await tester.pumpAndSettle();

    // 3. Verifying the presence of elements (Assumptions)

    // Verifies that there is ONE input field with key 'nameField' (for Name).
    expect(find.byKey(const Key('nameField')), findsOneWidget); 

    // Verify that there is ONE input field with key 'emailField' (for Email).
    expect(find.byKey(const Key('emailField')), findsOneWidget); 

    // Checks that there is ONE input field with the key 'passwordField' (for Password).
    expect(find.byKey(const Key('passwordField')), findsOneWidget); 

    // Checks that there is ONE input field with the key 'repeatPasswordField' (for Password Validation).
    expect(find.byKey(const Key('repeatPasswordField')), findsOneWidget); 

    // Checks that there is ONE button with the exact text 'Create Account'.
    expect(find.text('Create Account'), findsOneWidget); 
  });
}