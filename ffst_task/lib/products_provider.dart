import 'package:flutter/material.dart';

class FavoritePprovider extends ChangeNotifier {
  List<Map<String, dynamic>> products = [
    {
      'image': 'images/sofa2.jpg',
      'name': 'Room Sofa',
      'price': '¥2500',
      'colors': [const Color(0xfff7993ae), const Color(0xfffc9a885), const Color(0xfff282828)],
      'isFavorite': false,
    },
    {
      'image': 'images/tv.jpg',
      'name': 'Toshiba Tv',
      'price': '¥35250',
      'colors': [const Color(0xfff414142), const Color(0xfff717172), const Color(0xfff282828)],
      'isFavorite': false,
    },
    {
      'image': 'images/lamp.jpg',
      'name': 'Table Lamp',
      'price': '¥1500',
      'colors': [const Color(0xfff323232), const Color(0xfffc9a885), const Color(0xfffa05a3f)],
      'isFavorite': false,
    },
    {
      'image': 'images/table.jpg',
      'name': 'Wood Table',
      'price': '¥3200',
      'colors': [const Color(0xfff947146), const Color(0xfffc9a885), const Color(0xfff282828)],
      'isFavorite': false,
    },
  ];

  void toggleFavorite(int index) {
    products[index]['isFavorite'] = !products[index]['isFavorite'];
    notifyListeners();
  }
}
