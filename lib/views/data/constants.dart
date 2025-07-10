import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> skills = [
  {'name': 'HTML', 'icon': FontAwesomeIcons.html5},
  {'name': 'CSS', 'icon': FontAwesomeIcons.css3},
  {'name': 'Tailwind CSS', 'icon': FontAwesomeIcons.wind},
  {'name': 'JavaScript', 'icon': FontAwesomeIcons.js},
  {'name': 'React', 'icon': FontAwesomeIcons.react},
  {'name': 'NextJS', 'icon': FontAwesomeIcons.arrowRight},
  {'name': 'NodeJS', 'icon': FontAwesomeIcons.nodeJs},
  {'name': 'Express', 'icon': FontAwesomeIcons.server},
  {'name': 'Python', 'icon': FontAwesomeIcons.python},
  {'name': 'Flask', 'icon': FontAwesomeIcons.flask},
  {'name': 'MongoDB', 'icon': FontAwesomeIcons.database},
  {'name': 'MySQL', 'icon': FontAwesomeIcons.database},
  {'name': 'PostgreSQL', 'icon': FontAwesomeIcons.database},
  {'name': 'Git', 'icon': FontAwesomeIcons.gitAlt},
  {'name': 'GitHub', 'icon': FontAwesomeIcons.github},
];

final List<Map<String, dynamic>> projects = [
  {
    'name': 'E-Commerce Website',
    'description':
        'GrocerEase is an e-commerce website that allows users to buy groceries online.',
    'image': 'assets/images/project1.png',
  },
  {
    'name': 'Admin Dashboard',
    'description':
        'Admin Dashboard is a dashboard for the admin to manage the website.',
    'image': 'assets/images/project2.png',
  },
  {
    'name': 'Recipe Finder',
    'description':
        'Recipe Finder is a website that allows users to find recipes based on the ingredients they have.',
    'image': 'assets/images/project3.png',
  },
  {
    'name': 'Website Portfolio',
    'description':
        'A website portfolio of mine to showcase my skills and background.',
    'image': 'assets/images/project4.png',
  },
];

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.grey,
  ),
  textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Colors.grey,
  ),
  textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
  ),
);
