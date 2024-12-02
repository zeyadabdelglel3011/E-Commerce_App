import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants.dart';

class SliderImages extends StatelessWidget {
   SliderImages({super.key});
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
     {
      return Stack(
        children: [
          SizedBox(height: 220,
            width: double.infinity,
            child: ClipRRect(borderRadius: BorderRadius.circular(15),
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                allowImplicitScrolling: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  Image.asset('images/slider.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset('images/image1.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset('images/slider3.png',
                    fit: BoxFit.cover,
                  ),
                ],

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SmoothPageIndicator(controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    type: WormType.normal,
                      activeDotColor: Colors.black,
                      dotColor: kprimaryColor,
                      dotHeight: 12,
                      dotWidth: 12,
                  ),


                ),
              ],
            ),
          ),






        ],
      );
    }
  }
}
