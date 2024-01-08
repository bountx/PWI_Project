import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigatorViewModel extends ChangeNotifier {
  int _currentIndex = 0;
 // TabController _tabController = TabController(length: 3, vsync: NavigatorState());


  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}