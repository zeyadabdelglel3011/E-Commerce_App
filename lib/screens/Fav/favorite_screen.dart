import 'package:ecommerce/Provider/favorite_provider.dart';
import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override

  Widget build(BuildContext context) {

    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;

    return  Scaffold(
     backgroundColor: kprimaryColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: const Text(
          "Favorite",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),

        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
      Expanded(child:ListView.builder(
      itemCount: finalList.length ,
          itemBuilder:(context , index){
            final favoriteItems = finalList[index];
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
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                            color : kprimaryColor ,
                            borderRadius: BorderRadius.circular(20),

                          ),
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(favoriteItems.image),
                        ),
                        const SizedBox(width: 20,),
                        // Text of items
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              favoriteItems.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Text(
                              favoriteItems.category,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Text(
                              "\$${favoriteItems.price}",
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
                  top: 40,
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


                    ],


                  ) ,

                ),

              ],
            );
          }
          )
      ),
        ],
      ),
    );
  }
}
