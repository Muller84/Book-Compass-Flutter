// custom_input_field.dart
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final bool obscureText;
  final ValueChanged<bool>? onToggleVisibility;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggleVisibility, // Callback for toggling visibility
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        // Eye icon (isPassword: true)
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  if (onToggleVisibility != null) {
                    onToggleVisibility!(!obscureText);
                  }
                },
              )
            : null,
      ),
    );
  }
}
