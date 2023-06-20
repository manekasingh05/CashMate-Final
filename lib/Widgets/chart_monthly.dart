import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseGraphDesign_monthly extends StatefulWidget {
  const ExpenseGraphDesign_monthly({Key? key}) : super(key: key);

  @override
  State<ExpenseGraphDesign_monthly> createState() =>
      _ExpenseGraphDesign_monthlyState();
}

class _ExpenseGraphDesign_monthlyState
    extends State<ExpenseGraphDesign_monthly> {
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
                const FlSpot(0, 4),
                const FlSpot(1, 5),
                const FlSpot(2, 7),
                const FlSpot(3, 6),
                const FlSpot(4, 6),
                const FlSpot(5, 9),
                const FlSpot(6, 3),
                const FlSpot(7, 7),
                const FlSpot(8, 7),
                const FlSpot(9, 8),
                const FlSpot(10, 5),
                const FlSpot(11, 0),
                const FlSpot(12, 2),
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
                        text = "Jan";
                        break;
                      case 2:
                        text = "Feb";
                        break;
                      case 3:
                        text = "March";
                        break;
                      case 4:
                        text = "April";
                        break;
                      case 5:
                        text = "May";
                        break;
                      case 6:
                        text = "June";
                        break;
                      case 7:
                        text = "July";
                        break;
                      case 8:
                        text = "Aug";
                        break;
                      case 9:
                        text = "Sept";
                        break;
                      case 10:
                        text = "Oct";
                        break;
                      case 11:
                        text = "Nov";
                        break;
                      case 12:
                        text = "Dec";
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
