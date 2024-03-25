import 'package:flutter/material.dart';
import "package:carousel_slider/carousel_slider.dart";

class JamPage extends StatefulWidget {
  const JamPage({super.key});

  @override
  State<JamPage> createState() => _JamPageState();
}

class _JamPageState extends State<JamPage> {
  // create a list of images
  List<Widget> carouselItems = [
    Image.asset("assets/images/coverjams1.jpg"),
    Image.asset("assets/images/coverjams2.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CarouselSlider(
        items: carouselItems,
        options : CarouselOptions(
          height: double.infinity,
          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayCurve: Curves.easeInSine,
          autoPlayAnimationDuration: const Duration(milliseconds: 500),
        )
        ),
    ));
  }
}
