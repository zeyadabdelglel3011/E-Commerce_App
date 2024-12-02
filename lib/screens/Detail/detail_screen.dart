import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/screens/Detail/image_slider.dart';
import 'package:ecommerce/screens/Detail/item_details.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'add_to_cart.dart';
import 'description.dart';
import 'detail_app_bar.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
   const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentIndex = 0 ;
  int currentColor = 0 ;
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kprimaryColor,
      body: SingleChildScrollView(
       scrollDirection: Axis.vertical,
        child: SafeArea(
            child:Column(
              children: [
                // back btn and fav icon
                DetailAppBar(product:widget.product,),
                // detail image slider
                ImageSlider(
                  image:widget.product.image,
                  onChange: (index){
                    setState(() {
                      currentIndex = index;
                    });
                  },

                ),
                const SizedBox(height: 10,),
                // dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5,
                    (index) => AnimatedContainer(duration: const Duration(microseconds: 300),
                    width: currentIndex == index ? 15 : 8,
                      height: 8,
                      margin:  const EdgeInsets.only(right: 3),
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentIndex == index ? Colors.black : Colors.grey,
                      )
                      ),
                    ),
                  ),
                const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  decoration:  const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    )
                  ),
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: 100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // product name , price , seller , rating
                      ItemDetails(product: widget.product,),
                      const SizedBox(height: 20,),
                      const Text(
                        'Color',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      // colors
                      Row(
                        children: List.generate(
                          widget.product.colors.length,
                          (index)=> GestureDetector(
                            onTap: (){
                              setState(() {
                                currentColor = index ;
                              });

                            },
                            child: AnimatedContainer(

                              duration: const Duration(milliseconds: 300
                            ),

                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: currentColor == index ? Border.all(color: widget.product.colors[index] ): null,
                                color: currentColor == index ? Colors.white : widget.product.colors[index],


                              ),
                              padding: currentColor == index ? const EdgeInsets.all(2): null,
                              margin: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: widget.product.colors[index],
                                  shape: BoxShape.circle,
                                ),

                              ),
                            ),
                          ),
                        ) ,
                      ),
                      const SizedBox(height: 20,),
                      // description
                      Description(desc: widget.product.desc,),
                      // add to cart
                      
                      


                    ],
                  ),
                ),


              ],
            ) ,
        ),
      ),
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
