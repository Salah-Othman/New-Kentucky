import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 200,
        aspectRatio: 0.2,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayCurve: Curves.easeInOut,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      carouselController: CarouselSliderController(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
            decoration: BoxDecoration(),
            child: Image.asset('assets/me.jpg'),
          ),
    );
  }
}
