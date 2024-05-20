// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class MyRangeSlider extends StatefulWidget {
  const MyRangeSlider({super.key});

  @override
  _MyRangeSliderState createState() => _MyRangeSliderState();
}

class _MyRangeSliderState extends State<MyRangeSlider> {
  RangeValues _values = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text('RangeSlider with Custom Labels'),
      ),
      body: Center(
        child: RangeSlider(
          values: _values,
          onChanged: (RangeValues newValues) {
            setState(() {
              _values = newValues;
            });
          },
          labels: RangeLabels(
            'Example ${_values.start.round()}%',
            '${_values.end.round()}%',
          ),
          min: 10,
          max: 100,
        ),
      ),
    );
  }
}
