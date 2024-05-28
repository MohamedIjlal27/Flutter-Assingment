import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/screens/dashboard_screen.dart';
import 'package:test_drive/screens/loading_screen.dart';
import 'package:test_drive/screens/statusstatistics_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
