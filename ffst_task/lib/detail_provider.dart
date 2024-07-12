import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  bool _isFavorite = false;
  int _selectedTab = -1; 

  bool get isFavorite => _isFavorite;
  int get selectedTab => _selectedTab; 

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  void setSelectedTab(int index) { 
    _selectedTab = index;
    notifyListeners();
  }
}
