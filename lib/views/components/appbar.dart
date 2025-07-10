import 'package:flutter/material.dart';
import 'package:flutter_portfolio/views/components/logo.dart';
import 'package:flutter_portfolio/views/pages/welcome.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Welcome()),
          );
        },
      ),
      title: Logo(),
      actions: [
        IconButton(onPressed: () => {}, icon: Icon(FontAwesomeIcons.github)),
        IconButton(onPressed: () => {}, icon: Icon(FontAwesomeIcons.facebook)),
        IconButton(onPressed: () => {}, icon: Icon(FontAwesomeIcons.linkedin)),
      ],
    );
  }
}
