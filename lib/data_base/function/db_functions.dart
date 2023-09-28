import 'package:e_commerce/data_base/models/db_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<UserModel>> userListNotifier = ValueNotifier([]);

void addUser(UserModel value) async {
  final userDB = await Hive.openBox<UserModel>('user_db');
  await userDB.add(value);
  userListNotifier.value.add(value);

  userListNotifier.notifyListeners();
}

Future<void> getAlluser() async {
  final userDB = await Hive.openBox<UserModel>('user_db');
  userListNotifier.value.clear();

  userListNotifier.value.addAll(userDB.values);
  userListNotifier.notifyListeners();
}
