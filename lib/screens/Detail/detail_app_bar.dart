import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';

import '../../Provider/favorite_provider.dart';
import '../../constants.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          },
            style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15)),
            icon: const Icon(Icons.arrow_back,

            ),),
          const Spacer(),
          IconButton(onPressed: (){},
            style: IconButton.styleFrom(backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15)),
            icon: const Icon(Icons.share_outlined,

            ),),
          const SizedBox(width: 10,),
          IconButton(onPressed: (){
            provider.toggleFavorite(product);
          },
            style: IconButton.styleFrom(backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15)),
            icon:  Icon(
              provider.isExist(product) ?
              Icons.favorite :
                  Icons.favorite_border,
              color: Colors.black,
              size: 25,

            ),),


        ],
      ),
    );
  }
}
