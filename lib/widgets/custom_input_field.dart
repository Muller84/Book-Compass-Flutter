import 'package:flutter/material.dart';

// CustomInputField Class
// Custom widget for text input field that standardizes appearance (OutlineInputBorder)
// and adds special functionality for passwords (toggling visibility using an icon).
class CustomInputField extends StatelessWidget {
  // Controller for accessing and editing the text from outside. REQUIRED.
  final TextEditingController controller;

  // The field label that will be displayed inside the frame. REQUIRED.
  final String labelText;

  // Specifies whether to display the password visibility toggle icon (eye). 
  final bool isPassword;

  // Specifies whether the text is currently hidden
  final bool obscureText;

  // Callback function that is called when the user clicks the eye icon.
  final ValueChanged<bool>? onToggleVisibility;

  // Widget constructor
  const CustomInputField({
    super.key, // Key to identify the widget within the Flutter tree.
    required this.controller,
    required this.labelText,
    this.isPassword = false, // Default value: no password
    this.obscureText = false, // Default value: text is visible
    this.onToggleVisibility, // Optional function
  });

  @override
  Widget build(BuildContext context) {
    // Flutter's basic input field
    return TextField(
      controller: controller,
      // Specifies whether to mask the text
      obscureText: obscureText,

      // Decoration of the input field
      decoration: InputDecoration(
        labelText: labelText,
        // Uses a standard border around the field
        border: const OutlineInputBorder(),
        // Icon at the end of the field
        suffixIcon: 
        isPassword
            ? IconButton(
                icon: Icon(
                  // Toggles the icon between an eye (visible) and a crossed-out eye (hidden)
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                // Action after pressing the icon (to toggle visibility)
                onPressed: () {
                  // If a callback function was supplied, it will be called.
                  if (onToggleVisibility != null) {
                    // Passes the new (opposite) value for obscureText to the parent widget.
                    onToggleVisibility!(!obscureText);
                  }
                },
              )
            : null, // If there is no password, we do not display the icon (null).
      ),
    );
  }
}