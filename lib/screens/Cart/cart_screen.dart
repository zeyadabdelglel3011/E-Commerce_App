import 'package:ecommerce/Provider/cart_provider.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';

import 'check_out.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;

    // for quantity
    productQuantity(IconData icon , int index){
      return GestureDetector(
        onTap: (){
          setState(() {
            icon == Icons.add
                ? provider.incrementQtn(index)
                : provider.decrementQtn(index) ;
          });
        },
        child: Icon(icon , size: 20,),

      );
    }

    return  Scaffold(

      // for total price and check out
      bottomSheet: const CheckOut(),
      backgroundColor: kprimaryColor,
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNavBarScreen()),);
                },
                  style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(15)),
                  icon: const Icon(Icons.arrow_back,

                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Text(
                    textAlign: TextAlign.center,
                    'My Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(),
              ],
            ),
          ),
          Expanded(child:ListView.builder(
              itemCount: finalList.length ,
              itemBuilder:(context , index){
                final cartItems = finalList[index];
            return Stack(
              children: [
                Padding(padding:const EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          color : kprimaryColor ,
                          borderRadius: BorderRadius.circular(20),

                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(cartItems.image),
                      ),
                      const SizedBox(width: 20,),
                      // Text of items
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItems.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            cartItems.category,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            "\$${cartItems.price}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),


                        ],
                      ),
                    ],
                  ),
                ),
                ),
                Positioned(
                  top: 35,
                  right: 35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){
                      finalList.removeAt(index);
                      setState(() {

                      });
                    },
                        icon:const Icon(Icons.delete,
                        color: Colors.red,
                          size: 25,
                        ) ,
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kprimaryColor,
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 2,
                        ),
                      ),
                      child:  Row(
                        children: [
                          const SizedBox(width: 10,),
                          productQuantity(Icons.remove, index),
                          const SizedBox(width: 10,),
                          Text(
                            cartItems.quantity.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          productQuantity(Icons.add, index),
                          const SizedBox(width: 10,),
                        ],
                      ),
                    ),

                  ],


                ) ,

                ),

              ],
            );
          } ) ,
          ),
        ],
      ),
      ),
    );
  }
}
// provider When user click on add to cart