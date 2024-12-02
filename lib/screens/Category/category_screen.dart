import 'package:flutter/material.dart';

import '../../models/products.dart';
import '../Home/Widget/product_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategories = [all,shoes,beauty,women,jewelry,men,];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),

        body:  SingleChildScrollView(
         scrollDirection: Axis.vertical,

          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:  selectedCategories[selectedIndex].length,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                childAspectRatio: .78,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ) ,

              itemBuilder: (context , index){
                return ProductCard(
                  product:selectedCategories[selectedIndex][index] ,);
              }
              ,
            ),
          ),
        ),



    );
  }
}
