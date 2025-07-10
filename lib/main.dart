import 'package:flutter/material.dart';
import 'package:flutter_portfolio/views/data/constants.dart';
import 'package:flutter_portfolio/views/pages/welcome.dart';

void main() {
  runApp(const AboutMe_Marasigan());
}

class AboutMe_Marasigan extends StatelessWidget {
  const AboutMe_Marasigan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: Welcome(),
    );
  }
}
