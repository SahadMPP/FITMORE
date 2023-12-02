import 'dart:convert';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/screens/admin/add_product.dart';
import 'package:e_commerce/screens/admin/product_edit.dart';
import 'package:flutter/material.dart';

class AdminList extends StatefulWidget {
  const AdminList({super.key});

  @override
  State<AdminList> createState() => _AdminListState();
}

class _AdminListState extends State<AdminList> {
  @override
  Widget build(BuildContext context) {
    productt.getAllProduct();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Product List',
          style: TextStyle(
            color: Color.fromARGB(255, 123, 123, 123),
            fontSize: 22,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddProductScreen()));
            },
            color: Colors.black,
          )
        ],
      ),
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: productListNotifier,
            builder: (BuildContext context, List<ProductModel> productList,
                Widget? child) {
              return ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    final data = productList[index];
                    final base64Image = data.image1;
                    final imageBytes = base64.decode(base64Image);
                    GlobalKey<FormState> formkey = GlobalKey<FormState>();
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 110,
                        child: Dismissible(
                          key: formkey,
                          onDismissed: (direction) {
                            setState(() {
                              productList.removeAt(index);
                            });
                            productt.deleteProduct(data.id);
                          },
                          direction: DismissDirection.endToStart,
                          background: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE6E6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 280),
                              child: Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 248, 55, 41),
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 78,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 85,
                                  width: 60,
                                  child: Image(
                                    // ignore: unnecessary_null_comparison
                                    image: data.image1 == null
                                        ? const AssetImage(
                                                'asset/download(add image).png')
                                            as ImageProvider<Object>
                                        : MemoryImage(imageBytes),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 5),
                                    Text(
                                      data.title,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 21, 21),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 2,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Size ${index + 1}0',
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 65, 65, 65),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\$${data.price}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              color: Colors.red),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 190),
                                          child: IconButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductEdit(index),
                                                ));
                                              },
                                              icon: const Icon(
                                                Icons
                                                    .mode_edit_outline_outlined,
                                                color: Colors.grey,
                                                size: 25,
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
