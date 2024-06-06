import 'dart:convert';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/screens/admin/add_product.dart';
import 'package:e_commerce/screens/admin/product_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
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
                            padding: const EdgeInsets.only(right: 20),
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE6E6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 248, 55, 41),
                            ),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: SizedBox(
                                  height: 85,
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Image(
                                    fit: BoxFit.cover,
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
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxHeight: 100,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      data.title,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 21, 21, 21),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 2,
                                    ),
                                    Text(
                                      'Size ${index + 1}0',
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 65, 65, 65),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$${data.price}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              color: Colors.red),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductEdit(index),
                                              ));
                                            },
                                            icon: const Icon(
                                              Icons.mode_edit_outline_outlined,
                                              color: Colors.grey,
                                              size: 22,
                                            ))
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
