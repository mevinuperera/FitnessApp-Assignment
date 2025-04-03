import 'package:flutter/material.dart';
import 'welcome.dart';
import 'signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/signup': (context) =>  SignupPage(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Wait for 5 seconds before navigating to signup screen
    Future.delayed(const Duration(seconds: 9), () {
      Navigator.pushReplacementNamed(context, '/signup');
    });

    return Scaffold(
      body:  WelcomeAnimation(),
    );
  }
}