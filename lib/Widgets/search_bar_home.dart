import 'package:e_commerce/screens/user/search.dart';
import 'package:flutter/material.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.all(13),
          width: 250,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(
              width: .5,
              color: Colors.grey,
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search products',
                style: TextStyle(
                    color: Color.fromARGB(255, 122, 122, 122),
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
