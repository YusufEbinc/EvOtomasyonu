import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ev_gider_app/constants/const.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .33,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: CHomeCard),
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Container(
                  height: size.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_circle_fill,
                                color: CpieTayyip,
                              ),
                              Text(
                                "Tayyip",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: CpieTayyip),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_circle_fill,
                                color: CpieEmir,
                              ),
                              Text(
                                "Emir",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: CpieEmir),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_circle_fill,
                                color: CpieEmin,
                              ),
                              Text(
                                "Emin",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: CpieEmin),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_circle_fill,
                                color: CpieYusuf,
                              ),
                              Text(
                                "Yusuf",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: CpieYusuf),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: size.width * 0.6,
                  height: size.height * 0.3,
                  child: PieChart(
                    PieChartData(
                        sections: data,
                        sectionsSpace: 10,
                        centerSpaceRadius: 35),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> data = [
  PieChartSectionData(title: "", color: CpieEmin, value: 5),
  PieChartSectionData(title: "", color: CpieTayyip, value: 2),
  PieChartSectionData(title: "", color: CpieYusuf, value: 2),
  PieChartSectionData(title: "", color: CpieEmir, value: 3),
];
