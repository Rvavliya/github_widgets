import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/slidebar/action_slider.dart';
import 'package:flutter_gallery/src/view/slidebar/animation_slider.dart';
import 'package:flutter_gallery/src/view/slidebar/multi_circluer.dart';
import 'package:flutter_gallery/src/view/slidebar/slide_bar.dart';
import 'package:flutter_gallery/src/view/slidebar/slider_button.dart';
import 'package:flutter_gallery/src/view/slidebar/synction_slider.dart/syncfusion_sliders.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class SliderBarMain extends StatefulWidget {
  const SliderBarMain({super.key});

  @override
  State<SliderBarMain> createState() => _SliderBarMainState();
}

class _SliderBarMainState extends State<SliderBarMain> {
  final List<Screens> slider = [
    const Screens(fileName: "Slider Bar", navigation: SlideBarExample()),
    const Screens(fileName: "Action Slider", navigation: ActionSliderExample()),
    const Screens(fileName: "Slider Button", navigation: SliderButtonExample()),
    const Screens(
        fileName: "MultiCircular Slider",
        navigation: MultiCircularSliderExample()),
    const Screens(
        fileName: "Syncfunction Slider", navigation: SyncfunctionSlider()),
    const Screens(
        fileName: "Animation Slider", navigation: AnimatedSliderExample()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: Text("Slider bar")),
      body: FxGridView(
        screens: slider,
      ),
    );
  }
}
