import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/pageview/carousel_slider.dart';
import 'package:flutter_gallery/src/view/pageview/overlapped_carousel_slider.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({super.key});

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  List<Screens> pageView = [
    const Screens(
        fileName: "Overlapped CarouselSlider",
        navigation: OverlappedCarouselSlider()),
    const Screens(
        fileName: "Carousel Slider", navigation: CarouselSliderExample()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Page View"),
      ),
      body: FxGridView(screens: pageView),
    );
  }
}
