import 'package:flutter/material.dart';
import 'package:flutter_portfolio/views/data/constants.dart';
import 'package:flutter_portfolio/views/data/notifiers.dart';
import 'package:flutter_portfolio/views/pages/welcome.dart';
import 'package:flutter_portfolio/views/pages/pokemon.dart';

void main() {
  runApp(const AboutMe_Marasigan());
}

class AboutMe_Marasigan extends StatefulWidget {
  const AboutMe_Marasigan({super.key});

  @override
  State<AboutMe_Marasigan> createState() => _AboutMe_MarasiganState();
}

class _AboutMe_MarasiganState extends State<AboutMe_Marasigan> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier.theme,
      builder: (context, theme, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme ? darkTheme : lightTheme,
          routes: {'/pokemon': (context) => Pokemon()},
          home: Welcome(),
        );
      },
    );
  }
}
