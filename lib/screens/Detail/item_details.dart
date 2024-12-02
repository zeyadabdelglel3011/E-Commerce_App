import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final Product product;
  const ItemDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.title,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 25,
        ),
        ),

        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10,),
                Row(

                  children: [
                    Container(
                      width: 50,
                      height: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kcontentColor,
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child:  Row(
                        children: [
                          const Icon(Icons.star,
                          size: 14,
                          color: Colors.white,),
                          const SizedBox(width: 3,),
                          Text(
                            product.rate.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      product.review,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),

              ],
            ),
            const Spacer(),
             Text.rich(
             TextSpan(
               children: [
                 const TextSpan(
                   text: "Seller : ",style: TextStyle(
                   fontSize: 16,
                 ),
                 ),
                 TextSpan(
                   text: product.seller ,
                   style: const TextStyle(
                   fontSize: 16,
                     fontWeight: FontWeight.bold,
                 ),
                 ),
               ],
             ),
            ),
          ],

        ),
      ],
    ) ;
  }
}
