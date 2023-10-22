import 'package:e_commerce/data_base/models/favorite/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<FavoriteModel>> favoriteNotifier = ValueNotifier([]);

Favorite favoritee = Favorite();

// maybe favorite need some edit
class Favorite extends ChangeNotifier {
  Future<void> addInfavorite(FavoriteModel value) async {
    final favoriteDB = await Hive.openBox<FavoriteModel>('favorite_db');
    final id = await favoriteDB.add(value);
    value.id = id;
    final favorite = favoriteDB.get(id);
    await favoriteDB.put(
      id,
      FavoriteModel(
        id: id,
        title: favorite!.title,
        price: favorite.price,
        image: favorite.image,
      ),
    );
    favoriteNotifier.value.add(favorite);
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
