import 'package:flutter/material.dart';

/// Converts a hexadecimal color string to a Color object.
Color hexStringToColor(String hexColor) {
  // Convert the color string to upper case and remove the '#' symbol if present
  hexColor = hexColor.toUpperCase().replaceAll("#", "");

  // Check if the color string has 6 characters, if so, add 'FF' prefix
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }

  // Parse the hexadecimal color string to an integer and create a Color object
  return Color(int.parse(hexColor, radix: 16));
}
