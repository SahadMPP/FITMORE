import 'package:e_commerce/application/features/cart/widgets/cart_item.dart';
import 'package:e_commerce/application/features/cart/widgets/check_out_button.dart';
import 'package:e_commerce/application/features/cart/widgets/price_summery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartUi extends StatelessWidget {
  const CartUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.grey[300]!)),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: Colors.black,
          ),
        ),
        title: Text(
          'My cart',
          style: GoogleFonts.roboto(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        actions: [
          Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.grey[300]!)),
            child: const Icon(
              Icons.more_vert,
              size: 15,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CartItem(
                    imageUrl:
                        'https://fastly.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI', // Replace with actual image URL
                    name: 'Xbox series X',
                    price: 570.00,
                    quantity: 1,
                    subtitle: '1 TB',
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            const PriceSummary(
              subtotal: 800.00,
              deliveryFee: 5.00,
              discount: 40,
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey[300],
            ),
            const CheckoutButton(total: 480.00),
          ],
        ),
      ),
    );
  }
}
