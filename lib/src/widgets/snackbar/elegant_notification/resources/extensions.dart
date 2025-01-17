import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/snackbar/elegant_notification/resources/arrays.dart';
import 'package:flutter_gallery/src/widgets/snackbar/elegant_notification/resources/colors.dart';

extension NotificationTypeExtension on NotificationType {
  Color color() {
    switch (this) {
      case NotificationType.success:
        return successColor;
      case NotificationType.error:
        return errorColor;
      case NotificationType.info:
        return inforColor;
      default:
        return Colors.blue;
    }
  }
}
