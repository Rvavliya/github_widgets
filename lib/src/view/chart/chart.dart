import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/chart/line_chart.dart';
import 'package:flutter_gallery/src/view/chart/pie_chart.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class ChartExample extends StatefulWidget {
  const ChartExample({super.key});

  @override
  State<ChartExample> createState() => _ChartExampleState();
}

class _ChartExampleState extends State<ChartExample> {
  final List<Screens> charts = [
    const Screens(
        fileName: "Line Chart",
        navigation: LineChartExample(isShowingMainData: false)),
    const Screens(fileName: "PieChart", navigation: PieChartExample()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(
          title: Text("Charts"),
        ),
        body: FxGridView(
          screens: charts,
        ));
  }
}
