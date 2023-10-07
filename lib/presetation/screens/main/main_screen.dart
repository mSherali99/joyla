import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joyla/presetation/screens/account/account_screen.dart';
import 'package:joyla/presetation/screens/add/add.dart';
import 'package:joyla/presetation/screens/agreement/agreement_screen.dart';
import 'package:joyla/presetation/screens/home/bloc/home_bloc.dart';
import 'package:joyla/presetation/screens/home/home_screen.dart';

import '../../../data/source/local/dao.dart';
import '../save/saved_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SavedScreen(),
    const Add(),
    const AgreementScreen(),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          elevation: 24,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          onTap: _onItemTapped,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),

                ///SvgPicture.asset("assets/svg/home.svg"),*/
                label: "Asosiy"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken_rounded),

                ///SvgPicture.asset("assets/svg/heart.svg"),*/
                label: "Sevimli"),
            BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 64,
                        height: 39,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(-0.95, -0.32),
                            end: Alignment(0.95, 0.32),
                            colors: [Color(0xFF65C9F5), Color(0xFF0077AC)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/icons/plus.png",
                            width: 18,
                            height: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                label: ""),
            const BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),

                ///SvgPicture.asset("assets/svg/offer.svg"),*/
                label: "Takliflar"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp),

                ///SvgPicture.asset("assets/svg/account.svg"),*/
                label: "Profil"),
          ],
        ),
      ),
    );
  }
}
