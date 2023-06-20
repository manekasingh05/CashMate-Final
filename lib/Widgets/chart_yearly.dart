import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseGraphDesign_yearly extends StatefulWidget {
  const ExpenseGraphDesign_yearly({Key? key}) : super(key: key);

  @override
  State<ExpenseGraphDesign_yearly> createState() =>
      _ExpenseGraphDesign_yearlyState();
}

class _ExpenseGraphDesign_yearlyState extends State<ExpenseGraphDesign_yearly> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 10,
          minY: 0,
          maxY: 10,
          backgroundColor: Color.fromARGB(255, 14, 10, 32),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 0),
                const FlSpot(1, 3),
                const FlSpot(2, 5),
                const FlSpot(3, 6),
                const FlSpot(4, 2),
                const FlSpot(5, 1),
                const FlSpot(6, 9),
                const FlSpot(7, 8),
                const FlSpot(8, 5),
                const FlSpot(9, 7),
                const FlSpot(10, 8),
              ],
              isCurved: true,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF674AEF),
                  Colors.yellow,
                ],
              ),
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF674AEF).withOpacity(0.2),
                    Colors.yellow.withOpacity(0.2),
                  ],
                ),
              ),
              dotData: FlDotData(show: false),
            ),
          ],
          gridData: FlGridData(
              show: true,
              drawHorizontalLine: false,
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: Colors.grey.shade800,
                  strokeWidth: 0.8,
                );
              }),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 12,
                  getTitlesWidget: (value, meta) {
                    String text = '';
                    switch (value.toInt()) {
                      case 1:
                        text = "Joined";
                        break;
                      case 2:
                        text = "2015";
                        break;
                      case 3:
                        text = "2016";
                        break;
                      case 4:
                        text = "2017";
                        break;
                      case 5:
                        text = "2018";
                        break;
                      case 6:
                        text = "2019";
                        break;
                      case 7:
                        text = "2020";
                        break;
                      case 8:
                        text = "2021";
                        break;

                      default:
                        return Container();
                    }
                    return Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
