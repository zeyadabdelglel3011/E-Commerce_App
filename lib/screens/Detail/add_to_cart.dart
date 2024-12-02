import 'package:ecommerce/Provider/cart_provider.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  final Product product ;
  const AddToCart({super.key, required this.product});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int currentIndex = 1;
  late   final snack ;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        height: 85,
      //  width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.white,
                  width: 2,

                ),
              ),

              child:  Row(

                children: [
                 IconButton(onPressed: (){
                   setState(() {
                    if(currentIndex > 0){
                       currentIndex --;
                    }else {
                      currentIndex = 0 ;
                    }

                   });
                 },
                   iconSize: 18,
                     icon: const Icon(Icons.remove,
                     color: Colors.white,
                     ),
                 ),
                  const SizedBox(width: 5,),
                  Text(
                    currentIndex.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  IconButton(onPressed: (){
                    setState(() {
                      currentIndex++ ;
                    });
                  },
                    iconSize: 18,
                    icon: const Icon(Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                provider.toggleFavorite(widget.product);
                snack = const SnackBar(
                  content: Text('Successfully Added!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                    fontSize: 25,
                      color: Colors.white,
                    ),

                  ),
                  duration: Duration(
                    seconds: 2,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snack);
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: kcontentColor,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
