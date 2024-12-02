import 'package:ecommerce/Provider/cart_provider.dart';
import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = CartProvider.of(context);

    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              filled: true,
              fillColor: kprimaryColor,
              hintText: "Enter Discount Code",
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
              suffixIcon: TextButton(onPressed: (){},
                  child: const Text(
                    "Apply",
                    style: TextStyle(
                      color: kcontentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ) ,

              ),


            ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Subtotal",style:
                TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                "\$${provider.totalPrice()}",
                style:
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,

              ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const Divider(),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",style:
              TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,

              ),
              ),
               Text(
                "\$${provider.totalPrice()}",
                style:
                const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: kcontentColor,
              minimumSize: const Size(double.infinity, 55),
            ),
              child: const Text(
                "Check Out",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ) ,
          ),


        ],
      ),

    );
  }
}
