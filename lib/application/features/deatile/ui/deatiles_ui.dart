import 'package:e_commerce/application/features/deatile/widgets/bottom_part.dart';
import 'package:e_commerce/application/features/deatile/widgets/middle_part.dart';
import 'package:flutter/material.dart';

class DeatilesUi extends StatelessWidget {
  const DeatilesUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,

        surfaceTintColor: Colors.white,
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
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 33,
            width: 32,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.grey[300]!)),
            child: const Icon(
              Icons.heart_broken,
              size: 18,
              color: Colors.red,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 33,
            width: 32,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.grey[300]!)),
            child: const Icon(
              Icons.file_upload_outlined,
              size: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body:  const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: CusMiddle(),
              ),
            ),
            CusBottom(),
          ],
        ),
      ),
    );
  }
}





