import 'dart:io';
import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/Widgets/text_field_reg.dart';
import 'package:e_commerce/admin_side_functions/add_product_fun.dart';
import 'package:e_commerce/user_functions/profile_screen.dart';
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
  final _productCountController = TextEditingController();
  String? _productCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle('Add Product'),
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
          TextFieldInReg(
            icon: Icons.card_travel,
            labelText: 'Name',
            hintText: 'Enter product name',
            validatorText: 'Enter product name',
            keyboardType: TextInputType.name,
            obscureText: false,
            maxLength: null,
            nameController: _productNameController,
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
          TextFieldInReg(
            icon: Icons.price_change,
            labelText: 'Price',
            hintText: 'Enter product price',
            validatorText: 'Enter product price',
            keyboardType: TextInputType.phone,
            obscureText: false,
            maxLength: null,
            nameController: _priceController,
          ),
          const SizedBox(height: 15),
          TextFieldInReg(
            icon: Icons.production_quantity_limits,
            labelText: 'Stock',
            hintText: 'Enter product Stock',
            validatorText: 'Enter product Stock',
            keyboardType: TextInputType.phone,
            obscureText: false,
            maxLength: null,
            nameController: _productCountController,
          ),
          const SizedBox(height: 15),
          TextFieldInReg(
            icon: Icons.text_fields,
            labelText: 'Discription',
            hintText: 'Enter product Discription',
            validatorText: 'Enter product Discription',
            keyboardType: TextInputType.text,
            obscureText: false,
            maxLength: null,
            nameController: _discriptionController,
            maxLines: 4,
          ),
          const SizedBox(height: 10),
          Button(
              text: 'Add Product',
              onPressedCallback: () {
                addProductOnbuttenClick(
                    selectedImage1: selectedImage1,
                    selectedImage2: selectedImage2,
                    selectedImage3: selectedImage3,
                    selectedImage4: selectedImage4,
                    productNameController: _productNameController,
                    priceController: _priceController,
                    discriptionController: _discriptionController,
                    productCategory: _productCategory,
                    productCountController: _productCountController);
                Navigator.of(context).pop();
              })
        ],
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
