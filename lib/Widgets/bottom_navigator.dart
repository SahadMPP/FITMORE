import 'package:e_commerce/application/features/cart/ui/cart_screen.dart';
import 'package:e_commerce/application/features/home/ui/home_ui.dart';
import 'package:e_commerce/application/features/notification/ui/notification_ui.dart';
import 'package:e_commerce/application/features/profile/ui/profile_ui.dart';
import 'package:e_commerce/screens/user/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigator();
}

class _BottomNavigator extends State<BottomNavigator> {
  int selectedindex = 0;
  final List<Widget> pages = [
    const HomeUi(),
    const FavoriteScreen(),
    const ListOfNotification(),
    const CartScreen(),
    const ProfileUi()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 10.sh,
        child: BottomNavigationBar(
        
          // backgroundColor: Colors.white,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          selectedIconTheme: IconThemeData(
            size: 4.sh,
          ),
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey[300],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox_rounded),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedindex,
          selectedItemColor: Colors.amber[800],
          onTap: (index) {
            setState(() {
              selectedindex = index;
            });
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: pages[selectedindex],
    );
  }
}
