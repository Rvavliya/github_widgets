import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/indicator.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class PieChartSample1 extends StatefulWidget {
  const PieChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => PieChartSample1State();
}

class PieChartSample1State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Pie Chart"),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.3,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Indicator(
                    color: Colors.deepPurple,
                    text: 'One',
                    isSquare: false,
                    size: touchedIndex == 0 ? 18 : 16,
                    textColor: touchedIndex == 0
                        ? Colors.deepOrangeAccent
                        : Colors.greenAccent,
                  ),
                  Indicator(
                    color: Colors.black,
                    text: 'Two',
                    isSquare: false,
                    size: touchedIndex == 1 ? 18 : 16,
                    textColor: touchedIndex == 1 ? Colors.yellow : Colors.lime,
                  ),
                  Indicator(
                    color: Colors.lightBlueAccent,
                    text: 'Three',
                    isSquare: false,
                    size: touchedIndex == 2 ? 18 : 16,
                    textColor: touchedIndex == 2
                        ? Colors.lightBlueAccent
                        : Colors.indigo,
                  ),
                  Indicator(
                    color: Colors.cyan,
                    text: 'Four',
                    isSquare: false,
                    size: touchedIndex == 3 ? 18 : 16,
                    textColor: touchedIndex == 3 ? Colors.black : Colors.red,
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      startDegreeOffset: 180,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 1,
                      centerSpaceRadius: 0,
                      sections: showingSections(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      4,
      (i) {
        final isTouched = i == touchedIndex;
        const color0 = Colors.indigo;
        const color1 = Colors.black;
        const color2 = Colors.blue;
        const color3 = Colors.cyan;

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0,
              value: 25,
              title: '',
              radius: 80,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: Colors.white, width: 6)
                  : BorderSide(color: Colors.white.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: color1,
              value: 25,
              title: '',
              radius: 65,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: Colors.white, width: 6)
                  : BorderSide(color: Colors.white.withOpacity(0)),
            );
          case 2:
            return PieChartSectionData(
              color: color2,
              value: 25,
              title: '',
              radius: 60,
              titlePositionPercentageOffset: 0.6,
              borderSide: isTouched
                  ? const BorderSide(color: Colors.white, width: 6)
                  : const BorderSide(color: Colors.white),
            );
          case 3:
            return PieChartSectionData(
              color: color3,
              value: 25,
              title: '',
              radius: 70,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: Colors.white, width: 6)
                  : const BorderSide(color: Colors.white),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
