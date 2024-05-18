import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Item with ChangeNotifier {
  String date;
  String place;
  int budget;
  String comment;
  String type;
  int currentIndex;

  Item(
      {required this.date,
      required this.place,
      required this.budget,
      required this.comment,
      required this.type,
      required this.currentIndex});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'place': place,
      'budget': budget,
      'comment': comment,
      'type': type,
      'currentIndex': currentIndex
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        date: map['date'],
        place: map['place'],
        budget: map['budget'],
        comment: map['comment'],
        type: map['type'],
        currentIndex: map['currentIndex']);
  }
}

class ItemProvider extends ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  Future<void> loadItemsFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? itemsJson = prefs.getStringList('items');
    if (itemsJson != null) {
      _items = itemsJson.map((json) => Item.fromMap(jsonDecode(json))).toList();
      notifyListeners();
    }
  }

  Future<void> saveItemsToCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> itemsJson =
        _items.map((item) => jsonEncode(item.toMap())).toList();
    prefs.setStringList('items', itemsJson);
  }

  void addItem(Item item) {
    _items.add(item);
    saveItemsToCache();
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    saveItemsToCache();
    notifyListeners();
  }

  Future<void> updateItemInCache(Item item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? itemsJson = prefs.getStringList('items');
    if (itemsJson != null) {
      List<Item> items =
          itemsJson.map((json) => Item.fromMap(jsonDecode(json))).toList();
      int index = items.indexWhere((element) => element.place == item.place);
      if (index != -1) {
        items[index] = item;
        List<String> updatedItemsJson =
            items.map((item) => jsonEncode(item.toMap())).toList();
        prefs.setStringList('items', updatedItemsJson);
      }
    }
  }
}

class NewsItem {
  String title;
  String discription;
  String image;
  String fullDiscritp;
  NewsItem(
      {required this.title,
      required this.discription,
      required this.image,
      required this.fullDiscritp});
}
