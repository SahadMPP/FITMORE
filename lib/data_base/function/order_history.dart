import 'package:e_commerce/data_base/models/order_history/order_history_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<OrderhistoryModel>> orderhistoryNotify = ValueNotifier([]);
OrderHistory orderhistoryy = OrderHistory();

class OrderHistory extends ChangeNotifier {
  void addOrderHistory(OrderhistoryModel value) async {
    final orderDB = await Hive.openBox<OrderhistoryModel>('order_history_db');
    final id = await orderDB.add(value);
    value.id = id;
    final orderhistory = orderDB.get(id);
    await orderDB.put(
      id,
      OrderhistoryModel(
        image: orderhistory!.image,
        title: orderhistory.title,
        price: orderhistory.price,
        quantity: orderhistory.quantity,
      ),
    );
    orderhistoryNotify.value.add(orderhistory);
    orderhistoryNotify.notifyListeners();
  }
}
