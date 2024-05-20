import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/view/slidebar/multi_circluler_slider/circuler_slider.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class MultiCircularSliderExample extends StatefulWidget {
  const MultiCircularSliderExample({super.key});

  @override
  State<MultiCircularSliderExample> createState() =>
      _MultiCircularSliderExampleState();
}

class _MultiCircularSliderExampleState
    extends State<MultiCircularSliderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Multi Circuler Slider"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MultiCircularSlider(
            label: "Example",
            // trackColor: Colors.black,
            // innerWidget: const Text("data"),
            trackWidth: 20,
            size: MediaQuery.of(context).size.width * 0.8,
            progressBarType: MultiCircularSliderType.circular,
            values: const [0.1, 0.2, 0.2, 0.2],
            colors: const [
              Color(0xFFFD1960),
              Color(0xFF29D3E8),
              Color(0xFF18C737),
              Color(0xFFFFCC05)
            ],
            showTotalPercentage: true,
          ),
        ]),
      ),
    );
  }
}
