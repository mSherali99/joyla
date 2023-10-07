import 'package:flutter/material.dart';
import 'package:joyla/presetation/screens/splash/splash_screen.dart';

import 'di/di.dart';

void main() {
  diSetup();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: const MainScreen(),
      // home: const CategoryScreen(category: EnumCategory.electronics),
      home: const SplashScreen()
    );
  }
}


