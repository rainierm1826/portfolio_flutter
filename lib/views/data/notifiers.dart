import 'package:flutter/material.dart';

class PageNotifier {
  ValueNotifier<int> page = ValueNotifier<int>(0);

  void changePage(int currentPage) {
    page.value = currentPage;
  }
}

class ThemeNotifier {
  ValueNotifier<bool> theme = ValueNotifier<bool>(false);
}

final themeNotifier = ThemeNotifier();
final pageNotfier = PageNotifier();