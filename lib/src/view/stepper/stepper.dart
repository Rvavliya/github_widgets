import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/stepper/another_stepper.dart';
import 'package:flutter_gallery/src/view/stepper/custome_steper.dart';
import 'package:flutter_gallery/src/view/stepper/defult_stepper.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  List<Screens> stepperScreens = [
    const Screens(fileName: "Defult Stepper", navigation: DefualStepper()),
    const Screens(
        fileName: "Another Stepper", navigation: AnotherStepperExample()),
    const Screens(fileName: "Custom Stepper", navigation: CustomeStapper())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Stepper"),
      ),
      body: FxGridView(screens: stepperScreens),
    );
  }
}
