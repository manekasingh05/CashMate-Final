import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseGraphDesign_weekly extends StatefulWidget {
  const ExpenseGraphDesign_weekly({Key? key}) : super(key: key);

  @override
  State<ExpenseGraphDesign_weekly> createState() =>
      _ExpenseGraphDesign_weeklyState();
}

class _ExpenseGraphDesign_weeklyState extends State<ExpenseGraphDesign_weekly> {
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
                const FlSpot(0, 3),
                const FlSpot(1, 7),
                const FlSpot(2, 3),
                const FlSpot(3, 6),
                const FlSpot(4, 4),
                const FlSpot(5, 7),
                const FlSpot(6, 8),
                const FlSpot(7, 9),
                const FlSpot(8, 4),
                const FlSpot(9, 7),
                const FlSpot(10, 6),
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
                        text = "1 June";
                        break;
                      case 2:
                        text = "8 June";
                        break;
                      case 3:
                        text = "15 June";
                        break;
                      case 4:
                        text = "22 June";
                        break;
                      case 5:
                        text = "29 June";
                        break;
                      case 6:
                        text = "6 July";
                        break;
                      case 7:
                        text = "13 July";
                        break;
                      case 8:
                        text = "20 July";
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
