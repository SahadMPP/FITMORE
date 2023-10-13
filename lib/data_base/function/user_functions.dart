import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<UserModel>> userListNotifier = ValueNotifier([]);
UserFunction userr = UserFunction();

class UserFunction extends ChangeNotifier {
  void addUser(UserModel value) async {
    print('Adding User');
    final userDB = await Hive.openBox<UserModel>('user_db');
    final id = await userDB.add(value);
    value.id = id;
    userListNotifier.value.add(value);

    userListNotifier.notifyListeners();
  }

  Future<void> getAlluser() async {
    final userDB = await Hive.openBox<UserModel>('user_db');
    userListNotifier.value.clear();
    userListNotifier.value.addAll(userDB.values);
    userListNotifier.notifyListeners();
  }

  Future<void> updateUser(int id, UserModel value) async {
    final userDB = await Hive.openBox<UserModel>('user_db');
    if (userDB.containsKey(id)) {
      await userDB.put(id, value);
      int index = userListNotifier.value.indexWhere((user) => user.id == id);
      if (index != -1) {
        userListNotifier.value[index] = value;
        userListNotifier.notifyListeners();
      }
    }
    value.id = id;
    await userDB.put(id, value);
  }
}
