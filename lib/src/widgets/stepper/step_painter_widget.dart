import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/stepper/stepper_paths.dart';
import 'package:provider/provider.dart';

class StepPainterWidget extends StatelessWidget {
  final PreferredSizeWidget stepperAvatar;
  final Widget stepperContent;
  final bool isLast;
  final PreferredSizeWidget stepperWidget;

  const StepPainterWidget({
    required this.stepperAvatar,
    required this.stepperContent,
    required this.isLast,
    super.key,
    required this.stepperWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            right: 5,
          ),
          child: stepperWidget,
        ),
        Expanded(
          child: CustomPaint(
            painter: RootPainter(
              stepperAvatar.preferredSize,
              context.watch<StepperThemeData>().lineColor,
              context.watch<StepperThemeData>().lineWidth,
              Directionality.of(context),
              isLast,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                stepperAvatar,
                Expanded(
                  child: stepperContent,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RootPainter extends CustomPainter {
  Size? avatar;
  late Paint _paint;
  Color? pathColor;
  double? strokeWidth;
  final TextDirection textDecoration;
  final bool isLast;

  RootPainter(this.avatar, this.pathColor, this.strokeWidth,
      this.textDecoration, this.isLast) {
    _paint = Paint()
      ..color = pathColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth!
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (textDecoration == TextDirection.rtl) {
      canvas.translate(size.width, 0);
    }
    double dx = avatar!.width / 1.9;
    if (textDecoration == TextDirection.rtl) {
      dx *= -1;
    }
    if (!isLast) {
      canvas.drawLine(
        Offset(dx, avatar!.height),
        Offset(dx, size.height),
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
