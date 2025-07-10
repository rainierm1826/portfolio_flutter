import 'package:flutter/material.dart';
import 'package:flutter_portfolio/views/data/notifiers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageNotfier.page,
      builder: (context, pageNumber, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
            NavigationDestination(icon: Icon(Icons.list), label: "Projects"),
            NavigationDestination(
              icon: Icon(FontAwesomeIcons.code),
              label: "Skills",
            ),
          ],
          selectedIndex: pageNumber,
          onDestinationSelected: (int currentPage) {
            pageNotfier.changePage(currentPage);
          },
        );
      },
    );
  }
}
