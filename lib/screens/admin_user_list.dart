import 'dart:convert';

import 'package:e_commerce/data_base/function/db_functions.dart';
import 'package:e_commerce/data_base/models/db_model.dart';
import 'package:flutter/material.dart';

class AdminUserListScreen extends StatelessWidget {
  const AdminUserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getAlluser();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            'Latest Customers',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Material(
        child: ValueListenableBuilder(
          valueListenable: userListNotifier,
          builder:
              (BuildContext context, List<UserModel> userModel, Widget? child) {
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                thickness: 2,
                height: 20,
              ),
              padding: const EdgeInsets.all(5),
              itemBuilder: (context, index) {
                final data = userModel[index];
                final base64Image = data.profile;
                final imageBytes =
                    base64Image != null ? base64.decode(base64Image) : null;
                return Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      child: Image(
                        // ignore: unnecessary_null_comparison
                        image: data.profile == null
                            ? const AssetImage('asset/images(person).png')
                                as ImageProvider<Object>
                            : MemoryImage(imageBytes!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            data.email,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: userModel.length,
            );
          },
        ),
      ),
    );
  }
}
