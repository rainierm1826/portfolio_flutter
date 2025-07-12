import 'package:flutter/material.dart';
import 'package:flutter_portfolio/views/components/appbar.dart';
import 'package:flutter_portfolio/views/components/navbar.dart';
import 'package:flutter_portfolio/views/data/notifiers.dart';
import 'package:flutter_portfolio/views/pages/projects.dart';
import 'package:flutter_portfolio/views/pages/personal.dart';
import 'package:flutter_portfolio/views/pages/skills.dart';
import 'package:flutter_portfolio/views/pages/contact.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final List<Widget> pages = [Personal(), Projects(), Skills(), Contact()];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageNotfier.page,
      builder: (context, pageNumber, child) {
        return Scaffold(
          appBar: const Appbar(),
          bottomNavigationBar: Navbar(),
          body: pages.elementAt(pageNumber),
        );
      },
    );
  }
}
