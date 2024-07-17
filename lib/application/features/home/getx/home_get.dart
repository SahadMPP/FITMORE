import 'package:e_commerce/screens/user/category_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeGet extends GetxController {
  AnimatedContainer buildDots({int? index, required currentPage}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 10 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color.fromARGB(255, 232, 138, 16)
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Column brandicons(
      String image, String name, int index, BuildContext context) {
    List<String> categoryName = [
      'Nike',
      'Adiddas',
      'Puma',
      'DS',
    ];
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategotyList(
                  category: categoryName[index],
                ),
              ),
            );
          },
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.black,
            child: Image(
              width: 56,
              image: AssetImage(image),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
