import 'dart:convert';
import 'dart:io';
import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/Widgets/text_field_reg.dart';
import 'package:e_commerce/admin_side_functions/product_edit_fun.dart';
import 'package:e_commerce/application/core/widgets/appbar.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
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
  late TextEditingController _productCountController;
  String? _productCategory;
  late ProductModel _productModel;

  @override
  void initState() {
    _productNameController = TextEditingController();
    _priceController = TextEditingController();
    _discriptionController = TextEditingController();
    _productCountController = TextEditingController();
    final productlist = productListNotifier.value;
    _productModel = productlist[widget.index];
    _productNameController.text = _productModel.title;
    _priceController.text = _productModel.price.toString();
    _discriptionController.text = _productModel.discription;
    _productCategory = _productModel.category;
    _productCountController.text = _productModel.productCount.toString();
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
      appBar: mainTitle('Edit Product'),
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
            TextFieldInReg(
              icon: Icons.card_travel,
              labelText: 'name',
              hintText: 'Enter product name',
              validatorText: 'Enter product name',
              keyboardType: TextInputType.text,
              obscureText: false,
              maxLength: null,
              nameController: _productNameController,
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
              child: DropdownButtonFormField<String>(
                value: _productCategory ?? categories[0],
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
            TextFieldInReg(
              icon: Icons.price_change,
              labelText: 'Price',
              hintText: 'Enter product Price',
              validatorText: 'Enter product Price',
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
              validatorText: 'Product Discription is empty',
              keyboardType: TextInputType.phone,
              obscureText: false,
              maxLength: null,
              maxLines: 4,
              nameController: _discriptionController,
            ),
            const SizedBox(height: 10),
            Button(
                text: 'Update',
                onPressedCallback: () {
                  updatingProductOnBUttonclick(
                      productModel: _productModel,
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
                }),
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
    final imageFile = File(returnedImage.path);
    if (mounted) {
      setState(() {
        selectedImage1 = imageFile;
      });
    }
  }

  Future pickImageFromGallery2() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    final imageFile = File(returnedImage.path);
    if (mounted) {
      setState(() {
        selectedImage2 = imageFile;
      });
    }
  }

  Future pickImageFromGallery3() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    final imageFile = File(returnedImage.path);
    if (mounted) {
      setState(() {
        selectedImage3 = imageFile;
      });
    }
  }

  Future pickImageFromGallery4() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    final imageFile = File(returnedImage.path);
    if (mounted) {
      setState(() {
        selectedImage4 = imageFile;
      });
    }
  }
}
