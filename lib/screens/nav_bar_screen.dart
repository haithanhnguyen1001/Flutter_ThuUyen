import 'package:ecommerce_thanh/constants.dart';
import 'package:ecommerce_thanh/screens/Cart/cart_screen.dart';
import 'package:ecommerce_thanh/screens/Home/home_screen.dart';
import 'package:ecommerce_thanh/screens/Favorite/favorite.dart';
import 'package:ecommerce_thanh/screens/Profile/profile.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;
  List screens = const [
    Scaffold(),
    Favorite(),
    HomeScreen(),
    CartScreen(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: kprimaryColor,
        child: const Icon(
          Icons.home,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: const Icon(Icons.grid_view_outlined),
              iconSize: 30,
              color: currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: const Icon(Icons.favorite_border),
              iconSize: 30,
              color: currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon: const Icon(Icons.shopping_cart_outlined),
              iconSize: 30,
              color: currentIndex == 3 ? kprimaryColor : Colors.grey.shade400,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
              icon: const Icon(Icons.person),
              iconSize: 30,
              color: currentIndex == 4 ? kprimaryColor : Colors.grey.shade400,
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}