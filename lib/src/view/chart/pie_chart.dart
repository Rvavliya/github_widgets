import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/chart/pie_chart/pie_chart1.dart';
import 'package:flutter_gallery/src/view/chart/pie_chart/pie_chart2.dart';
import 'package:flutter_gallery/src/view/chart/pie_chart/pie_chart3.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class PieChartExample extends StatefulWidget {
  const PieChartExample({super.key});

  @override
  State<PieChartExample> createState() => _PieChartExampleState();
}

class _PieChartExampleState extends State<PieChartExample> {
  final List<Screens> piCharts = [
    const Screens(fileName: "Sample 1", navigation: PieChartSample1()),
    const Screens(fileName: "Sample 2", navigation: PieChartSample2()),
    const Screens(fileName: "Sample 3", navigation: PieChartSample3()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(
          title: Text("Pi Chart Sample"),
        ),
        body: FxGridView(
          screens: piCharts,
        ));
  }
}
