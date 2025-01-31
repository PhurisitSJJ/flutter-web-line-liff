import 'package:flutter/material.dart';
// import 'package:flutter_line/screen/home_screen.dart';
// import 'package:flutter_line/screen/login_screen.dart';
import 'package:flutter_line/screen/loginweb_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginWebScreen());
  }
}
