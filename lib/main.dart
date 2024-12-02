import 'package:ecommerce/Provider/favorite_provider.dart';
import 'package:ecommerce/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
// import 'package:path_provider_android/path_provider_android.dart';
import 'package:provider/provider.dart';

import 'Provider/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_)=> CartProvider()),
        ChangeNotifierProvider(create: (_)=> FavoriteProvider()),
      ],

      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBarScreen(),
      ),

    );

}
