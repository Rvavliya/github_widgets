import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/overlape_slider/overlapped_carousel.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class OverlappedCarouselSlider extends StatefulWidget {
  const OverlappedCarouselSlider({super.key});

  @override
  State<OverlappedCarouselSlider> createState() =>
      _OverlappedCarouselSliderState();
}

class _OverlappedCarouselSliderState extends State<OverlappedCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Overlapped CarouselSlider"),
      ),
      //Wrap with Center to place the carousel center of the screen
      body: Center(
        //Wrap the OverlappedCarousel widget with SizedBox to fix a height. No need to specify width.
        child: SizedBox(
          height: min(MediaQuery.sizeOf(context).width / 3.3 * (16 / 9),
              MediaQuery.sizeOf(context).height / 3.3 * .9),
          child: OverlappedCarousel(
            widgets: List.generate(
                10,
                (index) => Card(
                      child: Container(
                        height: 200,
                        width: 200,
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                      ),
                    )), //List of widgets
            currentIndex: 2,
            onClicked: (index) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("You clicked at $index"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
