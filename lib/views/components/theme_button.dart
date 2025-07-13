import 'package:flutter/material.dart';
import 'package:flutter_portfolio/views/data/notifiers.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier.theme,
      builder: (context, theme, child) {
        return IconButton(
          onPressed: () => {themeNotifier.theme.value = !theme},
          icon: Icon(theme ? Icons.light_mode : Icons.dark_mode),
        );
      },
    );
  }
}
