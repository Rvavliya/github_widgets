// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class SlideBarExample extends StatefulWidget {
  const SlideBarExample({super.key});

  @override
  State<SlideBarExample> createState() => _SlideBarExampleState();
}

class _SlideBarExampleState extends State<SlideBarExample> {
  final ValueNotifier<double> _slider = ValueNotifier<double>(0.0);
  final ValueNotifier<double> _divisionSlider = ValueNotifier<double>(0.0);
  final ValueNotifier<double> _primarySlider = ValueNotifier<double>(0.0);
  final ValueNotifier<double> _secondarySlider = ValueNotifier<double>(0.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Slide bar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _sliderBar(),
            const SizedBox(height: 20),
            _sliderWithDivision(),
            const SizedBox(height: 20),
            _slidersecondaryTrackValue(),
          ],
        ),
      ),
    );
  }

  /// normal sliderBaar
  Widget _sliderBar() {
    return Column(
      children: [
        const Text(
          "Slider With lable",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ValueListenableBuilder(
          valueListenable: _slider,
          builder: (BuildContext context, value, Widget? child) {
            return Slider(
              activeColor: Colors.green,
              autofocus: true,
              // inactiveColor: Colors.red,
              semanticFormatterCallback: (value) {
                return value.round().toString();
              },
              value: value,
              max: 100,
              divisions: 100,
              label: _slider.value.round().toString(),
              onChanged: (double value) {
                _slider.value = value;
              },
            );
          },
        ),
      ],
    );
  }

  /// slider with division
  Widget _sliderWithDivision() {
    return Column(
      children: [
        const Text(
          "lider with division",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ValueListenableBuilder(
          valueListenable: _divisionSlider,
          builder: (BuildContext context, value, Widget? child) {
            return Slider(
              value: value,
              max: 100,
              divisions: 5,
              label: _divisionSlider.value.round().toString(),
              onChanged: (double value) {
                _divisionSlider.value = value;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _slidersecondaryTrackValue() {
    return Column(
      children: [
        _primarySliderWidget(),
        const SizedBox(height: 20),
        _secondarySliderWidget(),
      ],
    );
  }

  Widget _primarySliderWidget() {
    return Column(
      children: [
        const Text(
          "Primary Slider",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ValueListenableBuilder(
          valueListenable: _primarySlider,
          builder: (BuildContext context, value, Widget? child) {
            return Slider(
              value: value,
              secondaryTrackValue: _secondarySlider.value,
              label: _primarySlider.value.round().toString(),
              onChanged: (double value) {
                _primarySlider.value = value;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _secondarySliderWidget() {
    return Column(
      children: [
        const Text(
          "Secondary Slider",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ValueListenableBuilder(
          valueListenable: _secondarySlider,
          builder: (BuildContext context, value, Widget? child) {
            return Slider(
              value: _secondarySlider.value,
              label: _secondarySlider.value.round().toString(),
              onChanged: (double value) {
                _secondarySlider.value = value;
                _primarySlider.notifyListeners();
              },
            );
          },
        ),
      ],
    );
  }
}
