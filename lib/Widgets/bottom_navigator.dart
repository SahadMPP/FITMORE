import 'package:e_commerce/screens/user/cart_screen.dart';
import 'package:e_commerce/screens/user/favorite_screen.dart';
import 'package:e_commerce/screens/user/home.dart';
import 'package:e_commerce/screens/user/notification_screen.dart';
import 'package:e_commerce/screens/user/profile_screen.dart';
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
    const NotificationScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                // color: Color.fromARGB(255, 89, 88, 88),
                size: 30,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                // color: Color.fromARGB(255, 89, 88, 88),
                size: 30,
              ),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                // color: Color.fromARGB(255, 89, 88, 88),
                size: 30,
              ),
              label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                // color: Color.fromARGB(255, 89, 88, 88),
                size: 30,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                // color: Color.fromARGB(255, 89, 88, 88),
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
