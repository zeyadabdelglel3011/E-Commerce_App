import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){},
            style: IconButton.styleFrom(backgroundColor: kprimaryColor, padding: const EdgeInsets.all(15)),
            icon: const Icon(Icons.grid_view_rounded,
              size: 25,
            ),),
          IconButton(onPressed: (){},
            style: IconButton.styleFrom(backgroundColor: kprimaryColor, padding: const EdgeInsets.all(15)),
            icon: const Icon(Icons.notifications_none_outlined,
              size: 25,
            ),
          ),
        ],
      );
  }
}
