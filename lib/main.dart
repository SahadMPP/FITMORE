import 'package:e_commerce/data_base/models/address/db_address_model.dart';
import 'package:e_commerce/data_base/models/cart_/cart_model.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:e_commerce/screens/user/splash_scree.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

// ignore: constant_identifier_names
const SAVE_KEY_NAME = 'UserLoggidIn';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }
  if (!Hive.isAdapterRegistered(ProductModelAdapter().typeId)) {
    Hive.registerAdapter(ProductModelAdapter());
  }
  if (!Hive.isAdapterRegistered(AddressModelAdapter().typeId)) {
    Hive.registerAdapter(AddressModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CartModelAdapter().typeId)) {
    Hive.registerAdapter(CartModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "MenCart",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
