import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/animation/animated_builder.dart';
import 'package:flutter_gallery/src/view/animation/animated_container.dart';
import 'package:flutter_gallery/src/view/animation/animated_cross_fed.dart';
import 'package:flutter_gallery/src/view/animation/animated_list.dart';
import 'package:flutter_gallery/src/view/animation/animated_opacity.dart';
import 'package:flutter_gallery/src/view/animation/animated_physical_model.dart';
import 'package:flutter_gallery/src/view/animation/animated_text/animated_text.dart';
import 'package:flutter_gallery/src/view/animation/animated_text/text_animation.dart';
import 'package:flutter_gallery/src/view/animation/animated_text/text_scroll_animation.dart';
import 'package:flutter_gallery/src/view/animation/animation_align.dart';
import 'package:flutter_gallery/src/view/animation/flutter_staggered_animations/stagged_animation.dart';
import 'package:flutter_gallery/src/view/animation/scroll_animation/scroll_animation.dart';
import 'package:flutter_gallery/src/view/animation/transtion_animation/transtion_animation.dart';
import 'package:flutter_gallery/src/view/animation/hero_animation/hero_animation.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class AnimationExample extends StatefulWidget {
  const AnimationExample({super.key});

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  List<Screens> animation = [
    const Screens(
        fileName: "Transtion Animation",
        navigation: TranstionAnimationExaample()),
    const Screens(
        fileName: "AnimatedAlign", navigation: AnimatedAlignExample()),
    const Screens(fileName: "Animated Text", navigation: AnimatedTextExample()),
    const Screens(
        fileName: "Animated Builder", navigation: AnimatedBuilderExample()),
    const Screens(
        fileName: "Animated Container", navigation: AnimatedContainerExample()),
    const Screens(
        fileName: "Animated CrossFad", navigation: AnimatedCrossFadExample()),
    const Screens(fileName: "AnimatedList", navigation: AnimatedListExample()),
    const Screens(
        fileName: "AnimatedOpacity", navigation: AnimatedOpacityExample()),
    const Screens(
        fileName: "Animated PhysicalModel",
        navigation: AnimatedPhysicalModelExample()),
    const Screens(
        fileName: "Hero Animation", navigation: HeroAnimationExample()),
    const Screens(fileName: Strings.textAnimation, navigation: TextAnimation()),
    const Screens(
        fileName: Strings.animationWithcScroll, navigation: ScrollAnimation()),
    const Screens(
        fileName: Strings.textScrollWithanimation,
        navigation: TextScrollAnimation()),
    const Screens(
        fileName: Strings.staggeredAnimations,
        navigation: StagedAnimationExample()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Animation"),
      ),
      body: FxGridView(screens: animation),
    );
  }
}
