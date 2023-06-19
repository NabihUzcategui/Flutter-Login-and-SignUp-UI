import 'package:flutter/material.dart';

import 'screen/login_singup_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Singup UI',
      home: LoginSingupScreen(),
    );
  }
}