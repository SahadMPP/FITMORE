import 'package:e_commerce/data_base/function/coupon_function.dart';
import 'package:e_commerce/data_base/models/coupon/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Coupon List',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: ValueListenableBuilder(
              valueListenable: couponNotify,
              builder: (BuildContext context, List<CouponModel> couponList,
                  Widget? child) {
                return ListView.separated(
                  itemCount: couponList.length,
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 3),
                  itemBuilder: (context, index) {
                    final data = couponList[index];
                    return ListTile(
                      title: Text(data.code),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          size: 20,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          couponn.deleteCoupon(data.id!);
                        },
                      ),
                    );
                  },
                );
              },
            ),
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
                        addingCoupon(context);
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

  Future<void> addingCoupon(BuildContext context) async {
    final couponDB = await Hive.openBox<CouponModel>('coupon_db');

    final code = _couponCodeController.text;

    // ignore: unnecessary_null_comparison
    if (couponDB != null) {
      for (var i = 0; i < couponDB.length; i++) {
        final currentCode = couponDB.getAt(i);
        if (currentCode!.code == code) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.grey,
            margin: EdgeInsets.all(15),
            content: Text('Code already added'),
          ));
          return;
        }
      }
    }
    final coupon = CouponModel(code: code);
    await couponn.addCoupon(coupon);
  }
}
