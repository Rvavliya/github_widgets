import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class AnimatedTextExample extends StatefulWidget {
  const AnimatedTextExample({super.key});

  @override
  State<AnimatedTextExample> createState() => _AnimatedTextExampleState();
}

class _AnimatedTextExampleState extends State<AnimatedTextExample> {
  List<MaterialColor> colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  TextStyle colorizeTextStyle = const TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );
  List<String> radiobuttonName = [
    'Rotate effect Text',
    'Fade effect Text',
    'Typer effect Text',
    'Typewriter effect Text',
    'Scale effect Text',
    'Colorize effect Text',
    'TextLiquidFill effect Text',
    'Wavy effect Text',
    'Flicker effect Text',
  ];
  final ValueNotifier<String> _radiobutton =
      ValueNotifier<String>("Rotate effect Text");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Animated Text"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        physics: const ClampingScrollPhysics(),
        child: ValueListenableBuilder(
          valueListenable: _radiobutton,
          builder: (BuildContext context, String value, Widget? child) =>
              Center(
            child: Column(
              children: [
                radioButtonWidget(),
                const SizedBox(height: 30),
                if (value == "Rotate effect Text") ...{
                  _rotateAnimatedText(),
                } else if (value == "Fade effect Text") ...{
                  _fadeAnimatedText(),
                } else if (value == "Typer effect Text") ...{
                  _typerAnimatedText(),
                } else if (value == "Typewriter effect Text") ...{
                  _typewriterAnimatedText(),
                } else if (value == "Scale effect Text") ...{
                  _scaleAnimatedText(),
                } else if (value == "Colorize effect Text") ...{
                  _colorizeAnimatedText(),
                } else if (value == "TextLiquidFill effect Text") ...{
                  _textLiquidFillAnimatedText(),
                } else if (value == "Wavy effect Text") ...{
                  _wavyAnimatedText(),
                } else if (value == "Flicker effect Text") ...{
                  _flickerAnimatedText(),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget radioButtonWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Effect",
          style: TextStyle(fontSize: 20.sp),
        ),
        ValueListenableBuilder(
          valueListenable: _radiobutton,
          builder: (BuildContext context, value, Widget? child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                radiobuttonName.length,
                (index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                          ),
                          child: RadioListTile(
                            hoverColor: Colors.transparent,
                            tileColor: Colors.transparent,
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            selectedTileColor: Colors.transparent,
                            fillColor:
                                const MaterialStatePropertyAll(Colors.black),
                            contentPadding: EdgeInsets.zero,
                            title: Text(radiobuttonName[index]),
                            value: radiobuttonName[index],
                            groupValue: _radiobutton.value,
                            onChanged: (value) {
                              _radiobutton.value = value!;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _rotateAnimatedText() {
    return SizedBox(
      width: 350,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'Be',
            style: TextStyle(fontSize: 43.0),
          ),
          const SizedBox(width: 20),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 40.0,
              fontFamily: 'Horizon',
              color: Colors.black,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                RotateAnimatedText('AWESOME'),
                RotateAnimatedText('OPTIMISTIC'),
                RotateAnimatedText('DIFFERENT'),
              ],
              onTap: () {
                log("Tap Event");
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _fadeAnimatedText() {
    return SizedBox(
      width: double.infinity,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: ConstColor.black,
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            FadeAnimatedText(
              'do IT!',
            ),
            FadeAnimatedText('do it RIGHT!!'),
            FadeAnimatedText('do it RIGHT NOW!!!'),
          ],
          onTap: () {
            log("Tap Event");
          },
        ),
      ),
    );
  }

  Widget _typerAnimatedText() {
    return SizedBox(
      width: double.infinity,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 30.0,
          fontFamily: 'Bobbers',
          color: ConstColor.black,
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText(
                'It is not enough to do your best, you must know what to do, and then do your best - W.Edwards Deming'),
            // TyperAnimatedText('It is not enough to do your best,'),
            // TyperAnimatedText('you must know what to do,'),
            // TyperAnimatedText('and then do your best'),
            // TyperAnimatedText('- W.Edwards Deming'),
          ],
          onTap: () {
            log("Tap Event");
          },
        ),
      ),
    );
  }

  Widget _typewriterAnimatedText() {
    return SizedBox(
      width: double.infinity,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 30.0,
          fontFamily: 'Agne',
          color: ConstColor.black,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText('Discipline is the best tool'),
            TypewriterAnimatedText('Design first, then code'),
            TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
            TypewriterAnimatedText('Do not test bugs out, design them out'),
          ],
          onTap: () {
            log("Tap Event");
          },
        ),
      ),
    );
  }

  Widget _scaleAnimatedText() {
    return SizedBox(
      width: double.infinity,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 70.0,
          fontFamily: 'Canterbury',
          color: ConstColor.black,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            ScaleAnimatedText('Think'),
            ScaleAnimatedText('Build'),
            ScaleAnimatedText('Ship'),
          ],
          onTap: () {
            log("Tap Event");
          },
        ),
      ),
    );
  }

  Widget _colorizeAnimatedText() {
    return SizedBox(
      width: double.infinity,
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            'Larry Page',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
          ColorizeAnimatedText(
            'Bill Gates',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
          ColorizeAnimatedText(
            'Steve Jobs',
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
        ],
        isRepeatingAnimation: true,
        onTap: () {
          log("Tap Event");
        },
      ),
    );
  }

  Widget _textLiquidFillAnimatedText() {
    return SizedBox(
      width: 350.0,
      child: TextLiquidFill(
        text: 'LIQUIDY',
        waveColor: Colors.blueAccent,
        boxBackgroundColor: Colors.redAccent,
        textStyle: const TextStyle(
          fontSize: 80.0,
          fontWeight: FontWeight.bold,
        ),
        boxHeight: 300.0,
      ),
    );
  }

  Widget _wavyAnimatedText() {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText('Hello World'),
          WavyAnimatedText('Look at the waves'),
        ],
        isRepeatingAnimation: true,
        onTap: () {
          log("Tap Event");
        },
      ),
    );
  }

  Widget _flickerAnimatedText() {
    return SizedBox(
      width: double.infinity,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 35,
          color: Colors.black,
          shadows: [
            Shadow(
              blurRadius: 7.0,
              color: Colors.white,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            FlickerAnimatedText('Flicker Frenzy'),
            FlickerAnimatedText('Night Vibes On'),
            FlickerAnimatedText("C'est La Vie !"),
          ],
          onTap: () {
            log("Tap Event");
          },
        ),
      ),
    );
  }
}
