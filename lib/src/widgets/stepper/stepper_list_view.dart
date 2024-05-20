import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/provider/stepper/stepper_data_model.dart';
import 'package:flutter_gallery/src/widgets/stepper/stepper_paths.dart';

class StepperListView extends StatelessWidget {
  const StepperListView({
    super.key,
    required this.stepperData,
    required this.stepAvatar,
    this.avatarRadius,
    this.stepWidget,
    this.stepSize,
    required this.stepContentWidget,
    this.stepperThemeData,
    this.controller,
    this.physics,
    this.shrinkWrap,
    this.addAutomaticKeepAlive,
    this.addSemanticIndexes,
    this.reverse,
    this.showStepperInLast,
  });

  final List<StepperItemData> stepperData;
  final StepperAvatarBuilder stepAvatar;
  final double? avatarRadius;
  final StepperWidgetBuilder? stepWidget;
  final Size? stepSize;
  final StepperContentBuilder stepContentWidget;
  final StepperThemeData? stepperThemeData;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final bool? shrinkWrap;
  final bool? addAutomaticKeepAlive;
  final bool? addSemanticIndexes;
  final bool? reverse;
  final bool? showStepperInLast;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      physics: physics,
      shrinkWrap: shrinkWrap ?? false,
      itemCount: stepperData.length,
      addAutomaticKeepAlives: addAutomaticKeepAlive ?? true,
      addSemanticIndexes: addSemanticIndexes ?? true,
      reverse: reverse ?? false,
      itemBuilder: (_, index) {
        return StepperWidget(
          stepperData[index],
          isLast: (showStepperInLast ?? true)
              ? false
              : stepperData.last == stepperData[index],
          stepperWidgetBuilder: (_, data) {
            return stepWidget != null
                ? PreferredSize(
                    preferredSize: stepSize ?? const Size.fromWidth(20),
                    child: stepWidget!(_, data),
                  )
                : const PreferredSize(
                    preferredSize: Size.zero,
                    child: SizedBox(),
                  );
          },
          stepperAvatarBuilder: (_, data) {
            return stepAvatar(_, data);
          },
          stepperContentBuilder: (_, data) {
            return stepContentWidget(_, data);
          },
          stepperThemeData: stepperThemeData,
        );
      },
    );
  }
}

typedef StepperAvatarBuilder<T> = PreferredSize Function(
  BuildContext context,
  T value,
);

typedef StepperWidgetBuilder<T> = PreferredSize Function(
  BuildContext context,
  T value,
);

typedef StepperContentBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

/// theme data
class StepperThemeData {
  final Color lineColor;
  final double lineWidth;

  const StepperThemeData({this.lineColor = Colors.grey, this.lineWidth = 1});
}
