import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/animation/transtion_animation/fade_transition.dart';
import 'package:flutter_gallery/src/view/animation/transtion_animation/rotation_transition.dart';
import 'package:flutter_gallery/src/view/animation/transtion_animation/scal_transition.dart';
import 'package:flutter_gallery/src/view/animation/transtion_animation/size_transition.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class TranstionAnimationExaample extends StatefulWidget {
  const TranstionAnimationExaample({super.key});

  @override
  State<TranstionAnimationExaample> createState() =>
      _TranstionAnimationExaampleState();
}

class _TranstionAnimationExaampleState
    extends State<TranstionAnimationExaample> {
  List<Screens> animation = [
    const Screens(
        fileName: "Fade Transition", navigation: FadeTransitionExample()),
    const Screens(
        fileName: "Rotation Transition",
        navigation: RotationTransitionExample()),
    const Screens(
        fileName: "Scale Transition", navigation: ScaleTransitionExample()),
    const Screens(
        fileName: "Size Transition", navigation: SizeTransitionExample()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Transtion Animation"),
      ),
      body: FxGridView(screens: animation),
    );
  }
}
