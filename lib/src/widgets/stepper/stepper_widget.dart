// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/stepper/stepper_paths.dart';
import 'package:provider/provider.dart';

class StepperWidget<R, C> extends StatefulWidget {
  final R root;

  final StepperAvatarBuilder<R> stepperAvatarBuilder;
  final StepperContentBuilder<R> stepperContentBuilder;
  final StepperWidgetBuilder<R> stepperWidgetBuilder;

  final StepperThemeData? stepperThemeData;
  final bool isLast;

  const StepperWidget(
    this.root, {
    this.stepperThemeData,
    required this.stepperAvatarBuilder,
    required this.stepperContentBuilder,
    required this.isLast,
    super.key,
    required this.stepperWidgetBuilder,
  });

  @override
  _StepperWidgetState<R, C> createState() => _StepperWidgetState<R, C>();
}

class _StepperWidgetState<R, C> extends State<StepperWidget<R, C>> {
  @override
  Widget build(BuildContext context) {
    final PreferredSize stepperAvatar = widget.stepperAvatarBuilder(
      context,
      widget.root,
    );

    final PreferredSize stepperWidget = widget.stepperWidgetBuilder(
      context,
      widget.root,
    );

    return Provider<StepperThemeData>.value(
      value: widget.stepperThemeData ?? const StepperThemeData(lineWidth: 1),
      child: StepPainterWidget(
        stepperAvatar: stepperAvatar,
        stepperContent: widget.stepperContentBuilder(
          context,
          widget.root,
        ),
        isLast: widget.isLast,
        stepperWidget: stepperWidget,
      ),
    );
  }
}
