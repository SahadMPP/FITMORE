import 'dart:convert';
import 'dart:io';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/screens/admin/admin_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  File? selectedImage1;
  File? selectedImage2;
  File? selectedImage3;
  File? selectedImage4;

  final _productNameController = TextEditingController();
  final _priceController = TextEditingController();
  final _discriptionController = TextEditingController();
  String? _productCategory;

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Nike',
      'Adiddas',
      'Puma',
      'DS',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Add Product',
            style: TextStyle(
              color: Color.fromARGB(255, 123, 123, 123),
              fontSize: 22,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 90),
            child: InkWell(
              onTap: () {
                pickImageFromGallery1();
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 202, 200, 200),
                    borderRadius: BorderRadius.circular(5)),
                child: selectedImage1 == null
                    ? Image.asset(
                        'asset/download(add image).png',
                        fit: BoxFit.fill,
                      )
                    : Image.file(
                        File(selectedImage1!.path),
                        fit: BoxFit.fill,
                      ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    pickImageFromGallery2();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 202, 200, 200),
                        borderRadius: BorderRadius.circular(5)),
                    child: selectedImage2 == null
                        ? Image.asset(
                            'asset/download(add image).png',
                            fit: BoxFit.fill,
                          )
                        : Image.file(
                            File(selectedImage2!.path),
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    pickImageFromGallery3();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 202, 200, 200),
                        borderRadius: BorderRadius.circular(5)),
                    child: selectedImage3 == null
                        ? Image.asset(
                            'asset/download(add image).png',
                            fit: BoxFit.fill,
                          )
                        : Image.file(
                            File(selectedImage3!.path),
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    pickImageFromGallery4();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 202, 200, 200),
                        borderRadius: BorderRadius.circular(5)),
                    child: selectedImage4 == null
                        ? Image.asset(
                            'asset/download(add image).png',
                            fit: BoxFit.fill,
                          )
                        : Image.file(
                            File(selectedImage4!.path),
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
            child: TextFormField(
              controller: _productNameController,
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: EdgeInsets.all(20),
                hintText: 'Enter product name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
            child: DropdownButtonFormField<String>(
              value: _productCategory,
              decoration: const InputDecoration(
                fillColor: Color(0xABFFFEFE),
                labelText: 'product category',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _productCategory = value!;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a category';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
            child: TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: EdgeInsets.all(20),
                hintText: 'Enter product price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
            child: TextFormField(
              maxLines: 4,
              controller: _discriptionController,
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: EdgeInsets.all(20),
                hintText: 'Enter product Discription',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 255, 145, 0),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {
                  addProductOnbuttenClick();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const AdminList()));
                },
                child: const Text(
                  'Add Product',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addProductOnbuttenClick() async {
    final bytes1 = await selectedImage1!.readAsBytes();
    final String base64Image1 = base64Encode(bytes1);

    final bytes2 = await selectedImage2!.readAsBytes();
    final String base64Image2 = base64Encode(bytes2);

    final bytes3 = await selectedImage3!.readAsBytes();
    final String base64Image3 = base64Encode(bytes3);

    final bytes4 = await selectedImage4!.readAsBytes();
    final String base64Image4 = base64Encode(bytes4);

    final name = _productNameController.text.trim();
    final price = _priceController.text.trim();
    final discription = _discriptionController.text.trim();
    final category = _productCategory;

    if (name.isEmpty ||
        price.isEmpty ||
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
        price: price,
        category: category!);

    addProduct(product);
  }

  Future pickImageFromGallery1() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    setState(() {
      selectedImage1 = File(returnedImage.path);
    });
  }

  Future pickImageFromGallery2() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    setState(() {
      selectedImage2 = File(returnedImage.path);
    });
  }

  Future pickImageFromGallery3() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    setState(() {
      selectedImage3 = File(returnedImage.path);
    });
  }

  Future pickImageFromGallery4() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    setState(() {
      selectedImage4 = File(returnedImage.path);
    });
  }
}
