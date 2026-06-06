import 'package:flutter/material.dart';
import 'features/wallet/screens/wallet_screen.dart';
import 'features/auth/screens/login_screen.dart';
void main() {
  runApp(const FinPayApp());
}

class FinPayApp extends StatelessWidget {
  const FinPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinPay Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
