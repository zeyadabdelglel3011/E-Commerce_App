import 'package:ecommerce/screens/Cart/cart_screen.dart';

import 'package:ecommerce/screens/Fav/favorite_screen.dart';
import 'package:ecommerce/screens/person/person_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'Category/category_screen.dart';
import 'Home/home_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0 ;
  List screens = const[
    CategoryScreen(),
    FavoriteScreen(),
    HomeScreen(),
    CartScreen(),
    PersonScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
               currentIndex = 2 ;
            });
          },
        shape: const CircleBorder(),
        backgroundColor: kcontentColor,
        child: const Icon(Icons.home_outlined,
        color: Colors.white,
          size: 35,
        ),


      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color:  Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              setState(() {
                currentIndex = 0 ;
              });
            },
              icon: Icon(Icons.grid_view_outlined,
                size: 30,
                color: currentIndex == 0 ? kcontentColor : Colors.grey.shade400,
              ),


            ),
            IconButton(onPressed: (){
              setState(() {
                currentIndex = 1 ;
              });
            },
              icon: Icon(Icons.favorite_border,
                size: 30,
                color: currentIndex == 1 ? kcontentColor : Colors.grey.shade400,
              ),


            ),
            const SizedBox(width: 20,),
            IconButton(onPressed: (){
              setState(() {
                currentIndex = 3 ;
              });
            },
              icon: Icon(Icons.shopping_cart_outlined,
                size: 30,
                color: currentIndex == 3 ? kcontentColor : Colors.grey.shade400,
              ),


            ),
            IconButton(onPressed: (){
              setState(() {
                currentIndex = 4 ;
              });
            },
              icon: Icon(Icons.person_outline,
                size: 30,
                color: currentIndex == 4 ? kcontentColor : Colors.grey.shade400,
              ),


            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}



