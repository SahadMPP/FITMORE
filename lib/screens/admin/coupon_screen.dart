import 'package:e_commerce/Widgets/coupon_note.dart';
import 'package:e_commerce/data_base/function/coupon_function.dart';
import 'package:e_commerce/user_functions/profile_screen.dart';
import 'package:flutter/material.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _couponCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    couponn.getAllCoupon();
    return Scaffold(
      appBar: mainTitle('Coupon List'),
      body: Column(
        children: [
          const Expanded(
            flex: 5,
            child: CouponNote(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field is Empty';
                          } else {
                            return null;
                          }
                        },
                        controller: _couponCodeController,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder()),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        addingCoupon(context, _couponCodeController);
                      }
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
