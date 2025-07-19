import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const SendMoneyApp());
}

class SendMoneyApp extends StatelessWidget {
  const SendMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send Money App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const SplashScreen(), // 🔥 Starts with your animated splash
      debugShowCheckedModeBanner: false,
    );
  }
}
