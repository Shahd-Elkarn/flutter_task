import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  bool _isFavorite = false;
  int _selectedTab = 0; 

  bool get isFavorite => _isFavorite;
  int get selectedTab => _selectedTab; 

  void favorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  void SelectedTab(int index) { 
    _selectedTab = index;
    notifyListeners();
  }
  
}
