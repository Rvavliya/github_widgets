import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class RadioButtonExample extends StatefulWidget {
  const RadioButtonExample({super.key});

  @override
  State<RadioButtonExample> createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {
  List<String> radiobuttonName = [
    'parcel',
    'ride sharing',
  ];
  final ValueNotifier<String> _radiobutton = ValueNotifier<String>("parcel");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Radio Button"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          radioButtonWidget(),
        ],
      ),
    );
  }

  Widget radioButtonWidget() {
    return ValueListenableBuilder(
      valueListenable: _radiobutton,
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            2,
            (index) {
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                      child: RadioListTile(
                        hoverColor: Colors.transparent,
                        tileColor: Colors.transparent,
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        selectedTileColor: Colors.transparent,
                        fillColor: const MaterialStatePropertyAll(Colors.black),
                        contentPadding: EdgeInsets.zero,
                        title: Text(radiobuttonName[index]),
                        value: radiobuttonName[index],
                        groupValue: _radiobutton.value,
                        onChanged: (value) {
                          _radiobutton.value = value!;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
