
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/screens/Home/Widget/slider_images.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/category.dart';
import 'Widget/Category.dart';
import 'Widget/home_app_bar.dart';
import 'Widget/product_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


 int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategories = [all,shoes,beauty,women,jewelry,men,];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // custom AppBar
              const CustomAppBar(),
              const SizedBox(height: 20,),
              // search bar
          Container(

            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kprimaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Row(
              children: [
                const  Icon(Icons.search,
                  color: Colors.grey,
                  size: 30,
                ),
                const SizedBox(width: 10,),
                const Flexible(
                  flex: 4,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,

                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: 1.5,
                  color: Colors.grey,
                ),
                IconButton(onPressed: (){},
                  icon: const Icon(Icons.tune,
                    color: Colors.grey,
                  ),
                ),

              ],
            ),
          ),
              const SizedBox(height: 20,),
              // slider
              SliderImages(),
              const SizedBox(height: 20,),
              // category selection
          SizedBox(
            height: 160,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context , index){
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex = index ;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    //height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: selectedIndex == index ?
                      Colors.blue[200] :
                      Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(categories[index].image,

                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(categories[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );

              },


            ),

          ),
              const SizedBox(height: 20,),
             // Text
             const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Special For You',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              // shopping items
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: selectedCategories[selectedIndex].length,
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




            ],
          ),
        ),
      ),
    );
  }







  }

