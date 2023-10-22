import 'package:e_commerce/data_base/models/address/db_address_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<AddressModel>> addressListNotifyer = ValueNotifier([]);
Address addres = Address();

class Address extends ChangeNotifier {
  Future<void> addAddress(AddressModel value) async {
    final addressdb = await Hive.openBox<AddressModel>('db_address');
    final id = await addressdb.add(value);
    value.id = id;
    final addres = addressdb.get(id);
    await addressdb.put(
        id,
        AddressModel(
            name: addres!.name,
            city: addres.city,
            state: addres.state,
            pincode: addres.pincode,
            phonenumber: addres.phonenumber,
            id: id));
    addressListNotifyer.value.add(addres);
    addressListNotifyer.notifyListeners();
  }

  Future<void> getAllAddress() async {
    final addressdb = await Hive.openBox<AddressModel>('db_address');
    addressListNotifyer.value.clear();
    addressListNotifyer.value.addAll(addressdb.values);
    addressListNotifyer.notifyListeners();
  }

  Future<void> deleteAddress(id) async {
    final addressdb = await Hive.openBox<AddressModel>('db_address');
    addressdb.delete(id);
    getAllAddress();
  }

  Future<void> updateAddress(int id, AddressModel value) async {
    final addressdb = await Hive.openBox<AddressModel>('db_address');
    if (addressdb.containsKey(id)) {
      int index =
          addressListNotifyer.value.indexWhere((address) => address.id == id);
      if (index != -1) {
        addressListNotifyer.value[index] = value;
        addressListNotifyer.notifyListeners();
      }
      value.id = id;
      await addressdb.put(id, value);
    }
  }
}
