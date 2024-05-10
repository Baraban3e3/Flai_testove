import 'package:fl_chart/fl_chart.dart';
import 'package:flai_test/utils/palette.dart';
import 'package:flai_test/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomChart extends StatelessWidget {
  const CustomChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (touchedSpot) => Palette.tooltipColor,
            fitInsideHorizontally: true,
            getTooltipItems: (touchedBarSpots) {
              return touchedBarSpots.map(
                (flSpot) {
                  return LineTooltipItem(
                    flSpot.y.toString(),
                    const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: [
                      const TextSpan(
                        text: '\n',
                      ),
                      TextSpan(
                        text: Utils.getDaysOfWeek()[flSpot.x.toInt()],
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    textAlign: TextAlign.left,
                  );
                },
              ).toList();
            }),
      ),
      gridData: const FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 100,
        verticalInterval: 6,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 220,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 0),
            FlSpot(1, 140),
            FlSpot(2, 169),
            FlSpot(3, 147),
            FlSpot(4, 180),
            FlSpot(5, 167),
            FlSpot(6, 220),
          ],
          isCurved: true,
          color: Palette.mainPurple,
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),

          // chart fill
          belowBarData: BarAreaData(
            show: true,
            gradient: const LinearGradient(
              begin: Alignment(-1.0, -1),
              end: Alignment(-1.0, 1),
              colors: Palette.fillPurpleGradient,
            ),
          ),
        ),
      ],
    ));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String hint;
    switch (value.toInt()) {
      case 0:
        hint = '0';
        break;
      case 55:
        hint = '55';
        break;
      case 110:
        hint = '110';
        break;
      case 165:
        hint = '165';
        break;
      case 220:
        hint = '220';
        break;
      default:
        return Container();
    }

    return Text(
      hint,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 11,
        color: Palette.textColor,
      ),
      textAlign: TextAlign.left,
    );
  }
}
