import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_gallery/src/constant/theme.dart';
import 'package:flutter_gallery/src/utils/extentaion.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class DefualStepper extends StatefulWidget {
  const DefualStepper({super.key});

  @override
  State<DefualStepper> createState() => _DefualStepperState();
}

class _DefualStepperState extends State<DefualStepper> {
  final ValueNotifier<int> _index = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Stepper"),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _index,
          builder: (BuildContext context, value, Widget? child) => Stepper(
            type: StepperType.vertical,
            stepIconBuilder: (stepIndex, stepState) {
              return const Icon(
                Icons.circle,
              );
            },
            controlsBuilder: (context, details) {
              return Container();
            },
            currentStep: _index.value,
            onStepCancel: () {
              if (_index.value > 0) {
                _index.value -= 1;
              }
            },
            onStepContinue: () {
              if (_index.value <= 0) {
                _index.value += 1;
              }
            },
            onStepTapped: (int index) {
              _index.value = index;
            },
            steps: <Step>[
              Step(
                isActive: _index.value == 0 ? true : false,
                title: const Text('Step 1 title'),
                content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Content for Step 1'),
                ),
              ),
              Step(
                state: StepState.complete, // stepper state.
                label: const Text("asNJDN"),
                isActive: _index.value == 1 ? true : false,
                title: const Text('Step 2 title'),
                content: const Text('Content for Step 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Step steper({
    bool? isActive,
    required String title,
    StepState? state,
    String? label,
    String? string1,
    String? string2,
    required BuildContext context,
  }) {
    return Step(
      state: state ?? StepState.indexed,
      label: Text(
        label ?? "",
        style: ConstTheme.mediumText(context),
      ),
      // isActive: _index.value == 0 ? true : false,
      isActive: isActive ?? false,
      title: Text(
        title,
        style: ConstTheme.mediumText(context),
      ),
      content: Card(
        elevation: 3,
        surfaceTintColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? Colors.grey.withOpacity(0.4)
                : ConstColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  string1 ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: ConstTheme.titleText(context),
                ),
                Divider(
                  color:
                      context.isDarkMode ? Colors.grey.withOpacity(0.6) : null,
                ),
                Text(
                  string2 ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ConstTheme.subTitleText(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
