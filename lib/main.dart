import 'package:flutter/material.dart';

import 'package:mobile_coding_banking_app/screens/home_page.dart';
import 'package:mobile_coding_banking_app/auth/sign_in_page.dart';
import 'package:mobile_coding_banking_app/auth/sign_up_page.dart';
import 'package:mobile_coding_banking_app/screens/currency_page.dart';
import 'package:mobile_coding_banking_app/screens/transfer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela de Login',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      home: const SignInPage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/currency': (context) => const CurrencyPage(),
        '/transfer': (context) => const TransferPage(),
      },
    );
  }
}
