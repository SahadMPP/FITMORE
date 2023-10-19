import 'package:flutter/material.dart';

class PaymentLastScareen extends StatefulWidget {
  const PaymentLastScareen({super.key});

  @override
  State<PaymentLastScareen> createState() => _PaymentLastScareenState();
}

class _PaymentLastScareenState extends State<PaymentLastScareen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                child: Image(
                  image: AssetImage('asset/Lcd5doyqi(tickMark).png'),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Order Placed Successfully!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
