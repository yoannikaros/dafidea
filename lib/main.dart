import 'package:dafidea/backup/ScrollController.dart';
import 'package:dafidea/ui/auth/register.dart';
import 'package:dafidea/ui/auth/sign_in.dart';
import 'package:dafidea/backup/sign_up.dart';
import 'package:dafidea/ui/beranda/home_page.dart';
import 'package:dafidea/ui/crud/add.dart';
import 'package:dafidea/ui/intro/intro.dart';
import 'package:dafidea/ui/main_pages.dart';
import 'package:dafidea/ui/intro/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/signin': (context) => const SignInPage(),
        '/home-page': (context) => HomePage(),
        '/add-page': (context) => const AddPage(),
        '/main-page': (context) => MainPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
