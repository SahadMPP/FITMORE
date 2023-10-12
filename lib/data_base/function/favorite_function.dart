import 'package:e_commerce/data_base/models/favorite/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<FavoriteModel>> favoriteNotifier = ValueNotifier([]);

Favorite favoritee = Favorite();

class Favorite extends ChangeNotifier {
  Future<void> addInfavorite(FavoriteModel value) async {
    final favoriteDB = await Hive.openBox<FavoriteModel>('favorite_db');
    print('Adding to favoritelist');
    final id = await favoriteDB.add(value);
    value.id = id;
    favoriteNotifier.value.clear();
    favoriteNotifier.notifyListeners();
  }

  Future<void> getAllFavorite() async {
    final favoriteDB = await Hive.openBox<FavoriteModel>('favorite_db');
    favoriteNotifier.value.clear();
    favoriteNotifier.value.addAll(favoriteDB.values);
    favoriteNotifier.notifyListeners();
  }

  Future<void> deleteFavorite(int id) async {
    final favoriteDB = await Hive.openBox<FavoriteModel>('favorite_db');
    favoriteDB.delete(id);
    getAllFavorite();
  }
}
