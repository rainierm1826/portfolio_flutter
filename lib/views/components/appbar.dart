import 'package:flutter/material.dart';
import 'package:flutter_portfolio/views/components/logo.dart';
import 'package:flutter_portfolio/views/components/theme_button.dart';
import 'package:flutter_portfolio/views/pages/welcome.dart';

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
      title: Logo(title: "RAINIER",),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/pokemon");
          },
          icon: Icon(Icons.blur_circular_outlined),
        ),
        ThemeButton(),
      ],
    );
  }
}
