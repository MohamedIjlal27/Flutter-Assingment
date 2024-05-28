import 'package:flutter/material.dart';
import 'package:test_drive/widgets/reusable_widget.dart';

class ForgotPasswordDialog {
  static void show(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Build the AlertDialog with title, content, and actions
        return AlertDialog(
          // Title section with reduced font size
          title: const Text(
            "Forgot Password!",
            style: TextStyle(fontSize: 18),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Instruction message for resetting password
              const Text(
                "Enter your email and we'll send you instructions to reset your password.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14),
              ),
              // Spacer for vertical spacing
              SizedBox(height: 16),
              // Reusable text field for entering email
              reusableTextField(
                "Email", // Label text for the email field
                Icons.email, // Icon for the email field
                false, // Indicates if the field is for passwords
                emailController, // Controller for managing the email field's input
              )
            ],
          ),
          // Shape configuration for the AlertDialog (no border radius)
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          // Background color of the AlertDialog (set to white)
          backgroundColor: Colors.white,
          // Actions section with a single submit button
          actions: [
            // Reusable button for submitting the email
            reusableButton(context, "Submit", () {}),
          ],
        );
      },
    );
  }
}
