import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class ActionSliderExample extends StatefulWidget {
  const ActionSliderExample({super.key});

  @override
  State<ActionSliderExample> createState() => _ActionSliderExampleState();
}

class _ActionSliderExampleState extends State<ActionSliderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Action Slider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _sleekCircularSlider(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _sleekCircularSlider() {
    return SleekCircularSlider(
      initialValue: 0,
      appearance: CircularSliderAppearance(
        // angleRange: 100,
        size: 150,
        spinnerDuration: 10,
        customColors: CustomSliderColors(
          dotColor: Colors.amber,
          dynamicGradient: false,
          hideShadow: true,
          trackColors: [
            Colors.amber,
            Colors.black,
            Colors.white,
          ],
        ),
        spinnerMode: false,
        // startAngle: 0,
      ),
      onChangeEnd: (value) {},
      onChangeStart: (value) {},
      onChange: (double value) {
        log(value.toString());
      },
    );
  }
}
