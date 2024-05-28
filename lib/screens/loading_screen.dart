import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_drive/color_utils.dart';
import 'package:test_drive/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Enable immersive mode to hide system UI for the splash screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Navigate to LoginScreen after a delay of 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    // Re-enable the system UI overlays when disposing the splash screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Ensure the container takes the full width of the screen
        width: double.infinity,
        decoration: BoxDecoration(
          // Add a gradient background
          gradient: LinearGradient(
            colors: [hexStringToColor("033D8C"), hexStringToColor("0598D1")],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          // Center the children vertically
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Spacer to push the image upwards
            const Spacer(flex: 2),
            // Display the logo image
            Image.asset(
              "assets/images/merchant-logo.png",
              width: 300,
              height: 200,
            ),
            CircularProgressIndicator(),
            // Spacer to fill the remaining space
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
