import 'package:flutter/material.dart';
import 'package:test_drive/color_utils.dart';

/// A reusable text field widget for inputting text data.
TextField reusableTextField(
  String text, // The label text for the text field
  IconData icon, // The icon to be displayed as a prefix for the text field
  bool
      isPasswordType, // Boolean indicating whether the text field is for passwords
  TextEditingController
      controller, // The controller for managing the text field's input
) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    cursorColor: Colors.black,
    style: TextStyle(color: hexStringToColor("666666"), fontSize: 20),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: hexStringToColor("666666"),
        size: 30,
      ),
      labelText: text,
      labelStyle: TextStyle(color: hexStringToColor("666666")),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1.0),
        // Set consistent width for the border
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1.5,
        ), // Adjusted color and width for better visibility
      ),
    ),
    keyboardType: TextInputType.text, // Changed to TextInputType.text
  );
}

/// A reusable button widget for triggering actions.
Container reusableButton(
  BuildContext context, // The build context for accessing MediaQuery
  String text, // The text to be displayed on the button
  Function
      onTap, // The callback function to be triggered when the button is tapped
) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      gradient: const LinearGradient(
        colors: [Color(0xFF033D8C), Color(0xFF0598D1)],
        // Gradient colors for the button background
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.black26;
            }
            return Colors.transparent; // Set transparent background for button
          },
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Text(
        text == "LogIn"
            ? "Log In"
            : text == "Submit"
                ? "Submit"
                : "Sign Up",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}
