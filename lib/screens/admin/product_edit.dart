import 'dart:convert';
import 'dart:io';
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
    _priceController.text = _productModel.price.toString();
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
                    updatingProductOnBUttonclick();
                    Navigator.of(context).pop();
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

  Future<void> updatingProductOnBUttonclick() async {
    String? base64Image1 = _productModel.image1;
    String? base64Image2 = _productModel.image2;
    String? base64Image3 = _productModel.image3;
    String? base64Image4 = _productModel.image4;

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

    final name = _productNameController.text.trim();
    final int price = int.parse(_priceController.text);
    final discription = _discriptionController.text.trim();
    final category = _productCategory;
    final id = _productModel.id;
    // print(name);
    // print(price);
    // print(discription);
    // print(category);
    // print(id);

    if (name.isEmpty ||
        discription.isEmpty ||
        base64Image1.isEmpty ||
        base64Image2.isEmpty ||
        base64Image3.isEmpty ||
        base64Image4.isEmpty) {
      return;
    }

    final updateStudent = ProductModel(
      id: _productModel.id!,
      title: _productNameController.text,
      discription: _discriptionController.text,
      category: category!,
      price: price,
      image1: base64Image1,
      image2: base64Image2,
      image3: base64Image3,
      image4: base64Image4,
    );

    productt.updateProduct(id!, updateStudent);
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
