import 'package:e_commerce/screens/cart_screen.dart';
import 'package:e_commerce/screens/favorite_screen.dart';
import 'package:e_commerce/screens/home.dart';
import 'package:e_commerce/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigator();
}

class _BottomNavigator extends State<BottomNavigator> {
  int selectedindex = 0;
  final List<Widget> pages = [
    const Home(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color.fromARGB(255, 140, 139, 139),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(255, 89, 88, 88),
                size: 30,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Color.fromARGB(255, 89, 88, 88),
                size: 30,
              ),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Color.fromARGB(255, 89, 88, 88),
                size: 30,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 89, 88, 88),
                size: 30,
              ),
              label: "Profile"),
        ],
        currentIndex: selectedindex,
        onTap: (int index) {
          setState(() {
            selectedindex = index;
          });
        },
      ),
      backgroundColor: Colors.white,
      body: pages[selectedindex],
    );
  }
}