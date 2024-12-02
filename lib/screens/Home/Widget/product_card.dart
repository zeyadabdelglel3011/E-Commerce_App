import 'package:ecommerce/Provider/favorite_provider.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/screens/Detail/detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductCard extends StatelessWidget {
  final Product product;
   const ProductCard({super.key, required this.product});




  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  DetailScreen(product: product,)),);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kprimaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(
                  height: 5,

                ),
                Center(
                  child: Image.asset(product.image,
                  width: 150,
                    height: 150,
                    fit: BoxFit.cover,

                  ),
                ),
                const SizedBox(height: 10,),
                 Padding(
                    padding: const EdgeInsets.only(left: 10),
                  child: Text(product.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: List.generate(product.colors.length,
                          (index) => Container(
                            width: 15,
                            height: 15,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              color: product.colors[index],
                              shape: BoxShape.circle,
                            ),
                          ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
          Positioned(child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
              width: 40,
              decoration:  const BoxDecoration(
                color:kcontentColor ,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: GestureDetector(
                onTap: (){
                  provider.toggleFavorite(product);

                },
                child:  Icon(
                  provider.isExist(product) ?
                      Icons.favorite :
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ) ,
          ),
        ],
      ),
    ) ;
  }
}
