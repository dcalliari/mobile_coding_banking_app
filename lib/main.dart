import 'package:flutter/material.dart';
import 'package:mobile_coding_banking_app/auth/sign_in_page.dart';
import 'package:mobile_coding_banking_app/auth/sign_up_page.dart';
import 'package:mobile_coding_banking_app/screens/currency_page.dart';
import 'package:mobile_coding_banking_app/screens/transfer_page.dart';
import 'package:mobile_coding_banking_app/components/home_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banking App',
      theme: ThemeData(
        primaryColor: Colors.grey.shade900,
        scaffoldBackgroundColor: Colors.grey.shade100,
        useMaterial3: true,
      ),
      initialRoute: '/sign-in',
      routes: {
        '/': (context) => const HomeNavigator(),
        '/transfer': (context) => const MyTransferPage(),
        '/currency': (context) => const MyCurrencyPage(),
        '/sign-in': (context) => const MySignInPage(),
        '/sign-up': (context) => const MySignUpPage(),
      },
    );
  }
}
