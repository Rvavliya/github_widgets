import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class AnotherStepperExample extends StatefulWidget {
  const AnotherStepperExample({super.key});

  @override
  State<AnotherStepperExample> createState() => _AnotherStepperExampleState();
}

class _AnotherStepperExampleState extends State<AnotherStepperExample> {
  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(
        "Order Placed",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: StepperText("Your order has been placed"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.looks_one, color: Colors.white),
      ),
    ),
    StepperData(
      title: StepperText("Preparing"),
      subtitle: StepperText("Your order is being prepared"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.looks_two, color: Colors.white),
      ),
    ),
    StepperData(
      title: StepperText("On the way"),
      subtitle: StepperText(
          "Our delivery executive is on the way to deliver your item"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.looks_3, color: Colors.white),
      ),
    ),
    StepperData(
      title: StepperText(
        "Delivered",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Another Stepper"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: AnotherStepper(
            stepperList: stepperData,
            stepperDirection: Axis.horizontal,
            iconWidth: 40,
            iconHeight: 40,
            activeBarColor: Colors.green,
            inActiveBarColor: Colors.grey,
            inverted: true,
            verticalGap: 30,
            activeIndex: 1,
            barThickness: 5,
          ),
        ),
      ),
    );
  }
}
