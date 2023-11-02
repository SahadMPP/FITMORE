import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/user_functions/payment_last_screen_func.dart';
import 'package:e_commerce/screens/user/payment/patment_scr_two.dart';
import 'package:flutter/material.dart';

class PaymContiAndPriceLastScr extends StatelessWidget {
  const PaymContiAndPriceLastScr({
    super.key,
    required this.allow,
    required this.widget,
    required this.groupValue,
  });

  final bool? allow;
  final PaymentScreenTwo widget;

  final String groupValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          allow == true
              ? Text(
                  '\$${afterdicount(widget.price, allow!)}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Text(
                  '\$${widget.price}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          SizedBox(
            width: 150,
            child: ValueListenableBuilder(
              valueListenable: productListNotifier,
              builder: (BuildContext context, List<ProductModel> productList,
                  Widget? child) {
                final data = productList[widget.productIndex];
                return ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                  ),
                  onPressed: () {
                    if (groupValue == 'Now3') {
                      addToOrderHistory(
                          productCount: data.productCount,
                          context: context,
                          imagee: widget.image,
                          titlee: widget.title,
                          pricee: widget.price);
                      final product = ProductModel(
                        title: data.title,
                        discription: data.discription,
                        image1: data.image1,
                        image2: data.image2,
                        image3: data.image3,
                        image4: data.image4,
                        price: data.price,
                        category: data.category,
                        productCount: data.productCount - widget.quantity,
                        id: data.id,
                      );
                      productt.updateProduct(data.id!, product);
                    }
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
