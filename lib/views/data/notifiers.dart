import 'package:flutter/material.dart';

class PageNotifier {
  ValueNotifier<int> page = ValueNotifier<int>(0);

  void changePage(int currentPage) {
    page.value = currentPage;
  }
}

final pageNotfier = PageNotifier();