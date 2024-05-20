import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  final ValueNotifier<String> _dateTime = ValueNotifier<String>("");
  final ValueNotifier<DateTime> _selectedDate =
      ValueNotifier<DateTime>(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Date & Time Picker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Center(
            child: OutlinedButton(
              onPressed: () {
                showDateTimePicker(
                  initialDateTime: DateTime.now(),
                  context: context,
                  onDateTimeChanged: (newDateTime) {
                    _dateTime.value =
                        (DateFormat("yyyy-MM-dd HH:mm").format(newDateTime));
                  },
                );
              },
              child: const Text('Open Date Picker'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: OutlinedButton(
              onPressed: () async {
                _selectedDate.value = await showCalendar(
                  context: context,
                );
              },
              child: const Text('Open Date & Time Picker'),
            ),
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: _dateTime,
            builder: (context, value, child) => Text(value),
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: _selectedDate,
            builder: (context, value, child) => Text(
              (DateFormat("yyyy-MM-dd").format(value)),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
