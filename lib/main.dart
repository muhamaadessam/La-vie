import 'package:flutter/material.dart';
import 'package:la_vie/presentation/screens/LoginScreen/loginScreen.dart';
import 'package:la_vie/presentation/screens/SplashScreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Vie',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}




