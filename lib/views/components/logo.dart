import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String title;

  const Logo({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontFamily: "Rowdies", fontWeight: FontWeight.bold),
    );
  }
}
