import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_gallery/src/constant/theme.dart';
import 'package:flutter_gallery/src/provider/stepper/stepper_data_model.dart';
import 'package:flutter_gallery/src/utils/extentaion.dart';
import 'package:flutter_gallery/src/widgets/stepper/stepper_paths.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class CustomeStapper extends StatefulWidget {
  const CustomeStapper({super.key});

  @override
  State<CustomeStapper> createState() => _CustomeStapperState();
}

class _CustomeStapperState extends State<CustomeStapper> {
  final List<StepperItemData> _stepperData = [
    const StepperItemData(
      id: '1',
      avtar: "avtar",
      title: "Subhash Chandra Shukla",
      subTitle: "Flutter Development",
    ),
    const StepperItemData(
      id: '2',
      avtar: "avtar",
      title: "Subhash Chandra Shukla",
      subTitle: " Development",
    ),
    const StepperItemData(
      id: '3',
      avtar: "avtar",
      title: "Subhash Chandra Shukla",
      subTitle: "Development 3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Time Sheet"),
      ),
      body: StepperListView(
        showStepperInLast: true, // last stepper line
        stepperData: _stepperData,
        stepAvatar: (_, data) {
          return const PreferredSize(
            preferredSize: Size.fromRadius(10),
            child: Icon(
              Icons.circle,
              size: 20,
            ),
          );
        },
        stepContentWidget: (_, data) {
          final stepData = data as StepperItemData;
          return Container(
            margin: const EdgeInsets.only(
              top: 20,
            ),
            padding: const EdgeInsets.all(
              15,
            ),
            child: _stepperDataWidget(
              title: stepData.title,
              subTitleText: stepData.subTitle,
              context: context,
            ),
          );
        },
        stepperThemeData: const StepperThemeData(
          lineColor: Colors.black,
          lineWidth: 3,
        ),
        physics: const BouncingScrollPhysics(),
      ),
    );
  }

  Widget _stepperDataWidget(
      {required String title,
      required String subTitleText,
      required BuildContext context}) {
    return Card(
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
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: ConstTheme.titleText(context),
              ),
              Divider(
                color: context.isDarkMode ? Colors.grey.withOpacity(0.6) : null,
              ),
              Text(
                subTitleText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: ConstTheme.subTitleText(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
