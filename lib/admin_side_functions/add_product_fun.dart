import 'dart:convert';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';

Future<void> addProductOnbuttenClick(
    {required selectedImage1,
    required selectedImage2,
    required selectedImage3,
    required selectedImage4,
    required productNameController,
    required priceController,
    required discriptionController,
    required productCategory,
    required productCountController}) async {
  final bytes1 = await selectedImage1!.readAsBytes();
  final String base64Image1 = base64Encode(bytes1);

  final bytes2 = await selectedImage2!.readAsBytes();
  final String base64Image2 = base64Encode(bytes2);

  final bytes3 = await selectedImage3!.readAsBytes();
  final String base64Image3 = base64Encode(bytes3);

  final bytes4 = await selectedImage4!.readAsBytes();
  final String base64Image4 = base64Encode(bytes4);

  final name = productNameController.text.trim();
  final int price = int.parse(priceController.text);
  final discription = discriptionController.text.trim();
  final category = productCategory;
  final count = int.parse(productCountController.text);

  if (name.isEmpty ||
      discription.isEmpty ||
      base64Image1.isEmpty ||
      base64Image2.isEmpty ||
      base64Image3.isEmpty ||
      base64Image4.isEmpty) {
    return;
  }

  final product = ProductModel(
      title: name,
      discription: discription,
      image1: base64Image1,
      image2: base64Image2,
      image3: base64Image3,
      image4: base64Image4,
      productCount: count,
      price: price,
      category: category!);

  productt.addProduct(product);
}

List<String> categories = [
  'Nike',
  'Adiddas',
  'Puma',
  'DS',
];
