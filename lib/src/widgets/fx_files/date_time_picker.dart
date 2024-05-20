import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showDateTimePicker({
  required BuildContext context,
  required void Function(DateTime) onDateTimeChanged,
  required DateTime? initialDateTime,
}) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext builder) {
      return Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height - 600,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                initialDateTime: initialDateTime,
                onDateTimeChanged: onDateTimeChanged,
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future showCalendar({
  required BuildContext context,
  DateTime? initialDateTime,
  DateTime? currentDate,
  DateTime? firstDate,
  DateTime? lastDate,
  DatePickerEntryMode? datePickerEntryMode,
  String? confirmText,
  String? helpText,
  String? cancelText,
}) {
  return showDatePicker(
    helpText: helpText ?? "Select your bithdate",
    cancelText: cancelText ?? "Cancle",
    confirmText: confirmText ?? "Ok",
    initialEntryMode: datePickerEntryMode ?? DatePickerEntryMode.calendar,
    currentDate: currentDate ?? DateTime.now(),
    initialDate: initialDateTime ?? DateTime.now(),
    context: context,
    firstDate: firstDate ?? DateTime(2000),
    lastDate: lastDate ?? DateTime(2030),
  );
}
