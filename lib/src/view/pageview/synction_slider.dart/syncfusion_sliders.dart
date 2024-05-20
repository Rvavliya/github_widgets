import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/view/slidebar/synction_slider.dart/rang_slider.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class SyncfunctionSlider extends StatefulWidget {
  const SyncfunctionSlider({super.key});

  @override
  State<SyncfunctionSlider> createState() => _SyncfunctionSliderState();
}

class _SyncfunctionSliderState extends State<SyncfunctionSlider> {
  final ValueNotifier<double> _sfSlider = ValueNotifier<double>(0.0);
  final ValueNotifier<double> _sfVerticalSlider = ValueNotifier<double>(0.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Syncfusion Sliders"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _sfSliderWidgets(),
          const SizedBox(height: 20),
          _sfSliderVerticalWidgets(),
          const SizedBox(height: 20),
          const RangSliderExample(),
        ],
      ),
    );
  }

  Widget _sfSliderWidgets() {
    return Column(
      children: [
        const Text(
          "Slider with name Horizontal",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ValueListenableBuilder(
          valueListenable: _sfSlider,
          builder: (BuildContext context, value, Widget? child) {
            return SfSlider(
              min: 0.0,
              max: 100.0,
              interval: 20,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              // numberFormat: NumberFormat("\$"),
              // labelPlacement: LabelPlacement.betweenTicks,
              // shouldAlwaysShowTooltip: true,
              // showDividers: true,

              dateFormat: DateFormat("dd-mm-yyy"),
              value: value,
              onChanged: (value) {
                _sfSlider.value = value;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _sfSliderVerticalWidgets() {
    return Column(
      children: [
        const Text(
          "Slider with name Vertical",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ValueListenableBuilder(
          valueListenable: _sfVerticalSlider,
          builder: (BuildContext context, value, Widget? child) {
            return SfSlider.vertical(
              min: 0.0,
              max: 100.0,
              interval: 20,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              // numberFormat: NumberFormat("\$"),
              // labelPlacement: LabelPlacement.betweenTicks,
              // shouldAlwaysShowTooltip: true,
              // showDividers: true,

              dateFormat: DateFormat("dd-mm-yyy"),
              value: value,
              onChanged: (value) {
                _sfVerticalSlider.value = value;
              },
            );
          },
        ),
      ],
    );
  }
}
