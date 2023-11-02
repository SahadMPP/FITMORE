import 'dart:convert';

import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';

Future<void> updatingProductOnBUttonclick(
    {required productModel,
    required selectedImage1,
    required selectedImage2,
    required selectedImage3,
    required selectedImage4,
    required productNameController,
    required priceController,
    required discriptionController,
    required productCategory,
    required productCountController}) async {
  String base64Image1 = productModel.image1;
  String? base64Image2 = productModel.image2;
  String? base64Image3 = productModel.image3;
  String? base64Image4 = productModel.image4;

  if (selectedImage1 != null) {
    final bytes1 = await selectedImage1!.readAsBytes();
    base64Image1 = base64Encode(bytes1);
  }
  if (selectedImage2 != null) {
    final bytes2 = await selectedImage2!.readAsBytes();
    base64Image2 = base64Encode(bytes2);
  }

  if (selectedImage3 != null) {
    final bytes3 = await selectedImage3!.readAsBytes();
    base64Image3 = base64Encode(bytes3);
  }

  if (selectedImage4 != null) {
    final bytes4 = await selectedImage4!.readAsBytes();
    base64Image4 = base64Encode(bytes4);
  }

  final name = productNameController.text.trim();
  final int price = int.parse(priceController.text);
  final discription = discriptionController.text.trim();
  final category = productCategory;
  final count = int.parse(productCountController.text);
  final id = productModel.id;

  if (name.isEmpty ||
      discription.isEmpty ||
      base64Image1.isEmpty ||
      base64Image2!.isEmpty ||
      base64Image3!.isEmpty ||
      base64Image4!.isEmpty) {
    return;
  }

  final product = ProductModel(
    id: productModel.id!,
    title: productNameController.text,
    discription: discriptionController.text,
    category: category!,
    price: price,
    productCount: count,
    image1: base64Image1,
    image2: base64Image2,
    image3: base64Image3,
    image4: base64Image4,
  );

  productt.updateProduct(id!, product);
}

List<String> categories = [
  'Nike',
  'Adiddas',
  'Puma',
  'DS',
];
