import 'package:flutter/material.dart';
import 'package:movie_discovery/features/coming_soon/views/coming_soon_screen.dart';
import 'package:movie_discovery/features/downloads/views/downloads_screen.dart';
import 'package:movie_discovery/features/home/views/home_screen.dart';
import 'package:movie_discovery/features/more/views/more_Screen.dart';
import 'package:movie_discovery/features/search/views/search_screen.dart';

class BottomBarController extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  final List<Widget> pages = const [
    HomeScreen(),
    SearchScreen(),
    ComingSoonScreen(),
    DownloadsScreen(),
    MoreScreen(),
  ];

  void changePage(int index) {
    if (_currentIndex == index) return;

    _currentIndex = index;

    notifyListeners();
  }
}
