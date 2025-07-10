import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "RAINIER",
      style: TextStyle(fontFamily: "Rowdies", fontWeight: FontWeight.bold),
    );
  }
}
