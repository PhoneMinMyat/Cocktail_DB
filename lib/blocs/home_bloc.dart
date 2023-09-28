import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeBloc extends ChangeNotifier {
  bool isDisposed = false;

  int selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  void changeIndex(int value) {
    selectedIndex = value;
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    safeNotifyListeners();
  }

  void safeNotifyListeners() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
