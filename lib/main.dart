import 'package:flutter/material.dart';
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
        home: HomeNavigator());
  }
}
