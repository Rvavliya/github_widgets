import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/buttons/animated_button_with_icon.dart';
import 'package:flutter_gallery/src/view/buttons/animation_button.dart';
import 'package:flutter_gallery/src/view/buttons/buttons.dart';
import 'package:flutter_gallery/src/view/buttons/tap_button_effect.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';

class ButtonTypes extends StatefulWidget {
  const ButtonTypes({super.key});

  @override
  State<ButtonTypes> createState() => _ButtonTypesState();
}

class _ButtonTypesState extends State<ButtonTypes> {
  List<Screens> buttonType = [
    const Screens(fileName: "Buttons", navigation: FlutterButtons()),
    const Screens(fileName: "Effect Buttons", navigation: OnTapEffectButton()),
    const Screens(fileName: "Animation Button", navigation: AnimationButton()),
    const Screens(
        fileName: "Animated Container With Icon",
        navigation: AnimatedContainerWithIcon()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(
          title: Text("Button Types"),
        ),
        body: FxGridView(screens: buttonType));
  }
}
