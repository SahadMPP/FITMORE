import 'package:e_commerce/Widgets/search_list.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ValueNotifier<List<ProductModel>> foundproduct = ValueNotifier([]);

  @override
  void initState() {
    foundproduct.value = productListNotifier.value;
    super.initState();
  }

  runFilter(String enteredKeyWord) {
    ValueNotifier<List<ProductModel>> result = ValueNotifier([]);

    if (enteredKeyWord.isEmpty) {
      result.value = productListNotifier.value;
    } else {
      List<ProductModel> filteredList = productListNotifier.value
          .where((product) => product.title
              .toLowerCase()
              .contains(enteredKeyWord.toLowerCase()))
          .toList();
      result.value = filteredList;
    }

    setState(() {
      foundproduct = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 45,
              color: Colors.grey,
            )),
        title: SizedBox(
          width: 310,
          child: TextField(
            onChanged: (value) => runFilter(value),
            decoration: const InputDecoration(
              labelText: 'search ',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              filled: true,
              fillColor: Color.fromARGB(255, 255, 255, 255),
              prefixIcon: Icon(Icons.search),
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.all(5),
            ),
          ),
        ),
      ),
      body: SearchListWidget(foundproduct: foundproduct),
    );
  }
}
