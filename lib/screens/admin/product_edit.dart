import 'dart:convert';
import 'dart:io';

import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/db_model.dart';
import 'package:e_commerce/screens/admin/admin_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductEdit extends StatefulWidget {
  final int index;
  const ProductEdit(this.index, {super.key});

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  File? selectedImage1;
  File? selectedImage2;
  File? selectedImage3;
  File? selectedImage4;

  final _formkey = GlobalKey<FormState>();
  late TextEditingController _productNameController;
  late TextEditingController _priceController;
  late TextEditingController _discriptionController;
  String? _productCategory;
  late ProductModel _productModel;
  List<String> categories = [
    'Nike',
    'Adiddas',
    'Puma',
    'DS',
  ];
  @override
  void initState() {
    _productNameController = TextEditingController();
    _priceController = TextEditingController();
    _discriptionController = TextEditingController();
    final productlist = productListNotifier.value;
    _productModel = productlist[widget.index];
    _productNameController.text = _productModel.title;
    _priceController.text = _productModel.price;
    _discriptionController.text = _productModel.discription;
    _productCategory = _productModel.category;
    super.initState();
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _priceController.dispose();
    _discriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final base64Image1 = _productModel.image1;
    final base64Image2 = _productModel.image2;
    final base64Image3 = _productModel.image3;
    final base64Image4 = _productModel.image4;
    final imageBytes1 = base64.decode(base64Image1);
    final imageBytes2 = base64.decode(base64Image2);
    final imageBytes3 = base64.decode(base64Image3);
    final imageBytes4 = base64.decode(base64Image4);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Edit Product',
            style: TextStyle(
              color: Color.fromARGB(255, 123, 123, 123),
              fontSize: 22,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 90, right: 90),
              child: InkWell(
                onTap: () {
                  pickImageFromGallery1();
                },
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 202, 200, 200),
                      borderRadius: BorderRadius.circular(5)),
                  child: selectedImage1 == null
                      ? Image(
                          image: MemoryImage(imageBytes1),
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
                          ? Image(
                              image: MemoryImage(imageBytes2),
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
                          ? Image(
                              image: MemoryImage(imageBytes3),
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
                          ? Image(
                              image: MemoryImage(imageBytes4),
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
                    final updateStudent = ProductModel(
                      title: _productNameController.text,
                      discription: _discriptionController.text,
                      category: _productCategory!,
                      image1: selectedImage1 != null
                          ? base64Encode(selectedImage1!.readAsBytesSync())
                          : _productModel.image1,
                      image2: selectedImage1 != null
                          ? base64Encode(selectedImage2!.readAsBytesSync())
                          : _productModel.image2,
                      image3: selectedImage1 != null
                          ? base64Encode(selectedImage3!.readAsBytesSync())
                          : _productModel.image3,
                      image4: selectedImage1 != null
                          ? base64Encode(selectedImage4!.readAsBytesSync())
                          : _productModel.image4,
                      price: _priceController.text,
                    );
                    updateProduct(_productModel.id!, updateStudent);

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AdminList()));
                  },
                  child: const Text(
                    'Update',
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
      ),
    );
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
