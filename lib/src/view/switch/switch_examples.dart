import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class SwitchExamples extends StatefulWidget {
  const SwitchExamples({super.key});

  @override
  State<SwitchExamples> createState() => _SwitchExamplesState();
}

class _SwitchExamplesState extends State<SwitchExamples> {
  final ValueNotifier<bool> _switchStyle = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _switch = ValueNotifier<bool>(false);
  final ValueNotifier<int> _isTapIndex = ValueNotifier<int>(1);
  final ValueNotifier<int> _value = ValueNotifier<int>(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Switch"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _switchStyleWidget(),
            const SizedBox(height: 20),
            _switchWidget(),
            const SizedBox(height: 20),
            _toggelSwitch(),
            const SizedBox(height: 20),
            _animatedToggleSwitch(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _switchWidget() {
    return Column(
      children: [
        const Text(
          "Switch",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder(
          valueListenable: _switch,
          builder: (BuildContext context, value, Widget? child) {
            return Switch(
              value: value,
              onChanged: (value) {
                _switch.value = value;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _switchStyleWidget() {
    return Column(
      children: [
        const Text(
          "Switch Style",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder(
          valueListenable: _switchStyle,
          builder: (BuildContext context, value, Widget? child) {
            return Switch(
              activeColor: Colors.red,
              activeTrackColor: Colors.black,
              autofocus: true,
              focusColor: Colors.amber,
              hoverColor: Colors.blue,
              materialTapTargetSize:
                  MaterialTapTargetSize.shrinkWrap, // remove unUsed space.
              // splashRadius: 20,
              thumbIcon: const MaterialStatePropertyAll(
                Icon(Icons.closed_caption),
              ),
              value: value,
              onChanged: (value) {
                _switchStyle.value = value;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _toggelSwitch() {
    return Column(
      children: [
        const Text(
          "Toggle Switch",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder(
          valueListenable: _isTapIndex,
          builder: (BuildContext context, value, Widget? child) {
            return ToggleButtons(
              splashColor: Colors.transparent,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(10),
                right: Radius.circular(10),
              ),
              isSelected: List.generate(
                  list.length, (index) => _isTapIndex.value == index),
              onPressed: (value) {
                _isTapIndex.value = value;
              },
              children: List.generate(
                list.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10).r,
                  child: Text(list[index]),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _animatedToggleSwitch() {
    return Column(
      children: [
        const Text(
          "Animated Toggle Switch",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder(
          valueListenable: _value,
          builder: (BuildContext context, value, Widget? child) {
            return AnimatedToggleSwitch.dual(
              active: true, // active and deactive button
              animationCurve: Curves.linear, // button animation
              animationDuration:
                  const Duration(seconds: 1), // animatin duration
              animationOffset: const Offset(1, 3),
              borderWidth: 2,
              clipAnimation: true,
              height: 50,
              loading: false, // if you can show loading

              iconBuilder: (value) {
                return const Icon(Icons.abc);
              },
              current: value,
              onChanged: (value) {
                _value.value = value;
              },
              style: const ToggleStyle(backgroundColor: Colors.red),
              first: 1,
              second: 2,
            );
          },
        ),
      ],
    );
  }
}
