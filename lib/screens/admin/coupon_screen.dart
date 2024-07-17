import 'package:e_commerce/Widgets/coupon_note.dart';
import 'package:e_commerce/application/core/widgets/appbar.dart';
import 'package:e_commerce/data_base/function/coupon_function.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
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
                decoration: InputDecoration(
                    suffixIcon:
                        IconButton(onPressed: ()async {
                             if (formKey.currentState!.validate()) {
                       bool value = await addingCoupon(context, _couponCodeController);
                       if (value) {
                         setState(() {
                           _couponCodeController.text = '';
                         });
                       }
                      }
                        }, icon: const Icon(Icons.add,size: 30,)),
                    hintText: "Type...",
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
            ),
            const SizedBox(height: 30),
            const Expanded(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CouponNote(),
            )),
          ],
        ),
      ),
    );
  }
}
