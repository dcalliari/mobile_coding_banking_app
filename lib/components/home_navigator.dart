import 'package:flutter/material.dart';
import 'package:mobile_coding_banking_app/screens/currency_page.dart';
import 'package:mobile_coding_banking_app/screens/home_page.dart';
import 'package:mobile_coding_banking_app/screens/transfer_page.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({super.key});

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List widgetOptions = [
      const MyHomePage(),
      const MyTransferPage(),
      const MyCurrencyPage(),
    ];
    void onTabTapped(index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade900,
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        onTap: onTabTapped,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pix_outlined),
            label: 'Transferências',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            label: 'Cotação',
          ),
        ],
      ),
    );
  }
}
