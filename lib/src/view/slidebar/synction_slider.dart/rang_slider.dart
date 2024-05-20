import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangSliderExample extends StatefulWidget {
  const RangSliderExample({super.key});

  @override
  State<RangSliderExample> createState() => _RangSliderExampleState();
}

class _RangSliderExampleState extends State<RangSliderExample> {
  SfRangeValues _rangeSlider = const SfRangeValues(00.0, 00.0);
  SfRangeValues _verticalSlider = const SfRangeValues(00.0, 00.0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _rangSlider(),
        const SizedBox(height: 30),
        _rangeSliderVertical(),
      ],
    );
  }

  Widget _rangSlider() {
    return Column(
      children: [
        const Text(
          "Rang Horizontal Slider",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SfRangeSlider(
          min: 0.0,
          max: 100.0,
          values: _rangeSlider,
          interval: 20,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          minorTicksPerInterval: 1,
          onChanged: (SfRangeValues value) {
            setState(() {
              _rangeSlider = value;
            });
          },
        ),
      ],
    );
  }

  Widget _rangeSliderVertical() {
    return Column(
      children: [
        const Text(
          "Rang Vertical Slider",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SfRangeSlider.vertical(
          min: 0.0,
          max: 100.0,
          values: _verticalSlider,
          interval: 20,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          minorTicksPerInterval: 1,
          onChanged: (SfRangeValues value) {
            setState(() {
              _verticalSlider = value;
            });
          },
        ),
      ],
    );
  }
}
