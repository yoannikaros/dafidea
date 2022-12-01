import 'package:dafidea/ui/ScrollController.dart';
import 'package:dafidea/ui/add.dart';
import 'package:dafidea/ui/home_page.dart';
import 'package:dafidea/ui/intro.dart';
import 'package:dafidea/ui/sign_in.dart';
import 'package:dafidea/ui/sign_up.dart';
import 'package:dafidea/ui/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/intro': (context) => const IntroPage(),
        '/Sign-up': (context) => const SignUpPage(),
        '/signin': (context) => const SignInPage(),
        '/home-page': (context) => const HomePage(),
        '/add-page': (context) => const AddPage(),
        '/get': (context) => GetData(),
      },
    );
  }
}
