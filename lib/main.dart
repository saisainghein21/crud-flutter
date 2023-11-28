import 'package:ap_assignment/firebase_options.dart';
import 'package:ap_assignment/pages/auth_page.dart';
import 'package:ap_assignment/pages/home_page.dart';
import 'package:ap_assignment/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dcdg/dcdg.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),//HomePage(),
    );
  }
}
