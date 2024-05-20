import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/animation/flutter_staggered_animations/flutter_staggered_grid.dart';
import 'package:flutter_gallery/src/view/animation/flutter_staggered_animations/flutter_staggered_list.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class StagedAnimationExample extends StatefulWidget {
  const StagedAnimationExample({super.key});

  @override
  State<StagedAnimationExample> createState() => _StagedAnimationExampleState();
}

class _StagedAnimationExampleState extends State<StagedAnimationExample> {
  List<Screens> staagedAnimation = [
    const Screens(
        fileName: Strings.staggeredListAnimations,
        navigation: StaggeredListAnimations()),
    const Screens(
        fileName: Strings.staggeredGridAnimations,
        navigation: StaggeredGridAnimations()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text(Strings.staggeredAnimations),
      ),
      body: FxGridView(screens: staagedAnimation),
    );
  }
}
