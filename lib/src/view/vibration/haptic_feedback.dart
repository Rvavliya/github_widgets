import 'dart:developer';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gallery/src/widgets/fx_files/button.dart';

class VibrationExample extends StatefulWidget {
  const VibrationExample({super.key});

  @override
  State<VibrationExample> createState() => _VibrationExampleState();
}

class _VibrationExampleState extends State<VibrationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Vibaration"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstButton(
              buttonName: "Heavy",
              onTap: () => HapticFeedback.heavyImpact()
                  .then((value) => log("Heavy Impact Feedback completed")),
            ),
            const SizedBox(height: 20),
            ConstButton(
              buttonName: "Medium",
              onTap: () => HapticFeedback.mediumImpact()
                  .then((value) => log("Medium Impact Feedback completed")),
            ),
            const SizedBox(height: 20),
            ConstButton(
              buttonName: "Vibration",
              onTap: () => HapticFeedback.lightImpact()
                  .then((value) => log("Light Impact Feedback completed")),
            ),
            const SizedBox(height: 20),
            ConstButton(
              buttonName: "Selection Click",
              onTap: () => HapticFeedback.selectionClick()
                  .then((value) => log("Selection Click Feedback completed")),
            ),
            const SizedBox(height: 20),
            ConstButton(
              buttonName: "Vibrate",
              onTap: () => HapticFeedback.vibrate()
                  .then((value) => log("Vibrate Feedback completed")),
            ),
          ],
        ),
      ),
    );
  }
}
