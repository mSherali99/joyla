import 'package:flutter/material.dart';
import 'package:joyla/presetation/screens/home/home_screen.dart';
import 'package:joyla/presetation/screens/intro/intro_screen.dart';
import 'package:joyla/presetation/screens/main/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var hasPage = false;

  @override
  void initState() {
    waitTime();
    super.initState();
    initalSharedPref();
  }

  Future<void> initalSharedPref() async {
    final pref = await SharedPreferences.getInstance();
    hasPage = (await pref.getBool("hasPage"))!;
  }

  Future<void> waitTime() async {
    Future.delayed(const Duration(microseconds: 2000)).then((value) => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        if (hasPage) {
          return const MainScreen();
        } else {
          return const IntroScreen();
        }
      }))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
            "assets/images/splash.png",
          width: 179,
          height: 179,
        ),
      ),
    );
  }
}
