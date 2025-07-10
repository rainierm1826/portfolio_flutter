import 'package:flutter/material.dart';
import 'package:flutter_portfolio/views/data/constants.dart';
import 'package:flutter_portfolio/views/pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: Welcome(),
    );
  }
}
