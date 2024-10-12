import 'package:expense_tracker_app/bar%20graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final double maxY;
  final double monAmount;
  final double tuesAmount;
  final double wedAmount;
  final double thursAmount;
  final double friAmount;
  final double satAmount;
  final double sunAmount;

  const MyBarGraph({
    super.key,
    required this.maxY,
    required this.monAmount,
    required this.tuesAmount,
    required this.wedAmount,
    required this.thursAmount,
    required this.friAmount,
    required this.satAmount,
    required this.sunAmount,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the bar data
    BarData myBarData = BarData(
      monAmount: monAmount,
      tuesAmount: tuesAmount,
      wedAmount: wedAmount,
      thursAmount: thursAmount,
      friAmount: friAmount,
      satAmount: satAmount,
      sunAmount: sunAmount,
    );

    myBarData.initializeBarData();

    return Padding(
      padding: const EdgeInsets.all(16.0), // Add padding
      child: BarChart(
        BarChartData(
            maxY: maxY,
            minY: 0,
            gridData: FlGridData(show: true), // Show grid for easier debugging
            borderData:
                FlBorderData(show: true), // Enable border to debug layout
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 40),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 42,
                  getTitlesWidget: getBottomTitles,
                ),
              ),
            ),
            barGroups: [
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(
                    toY: monAmount,
                    color: Colors.green.shade900,
                    width: 25,
                    borderRadius: BorderRadius.circular(4)),
              ]),
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(
                    toY: tuesAmount,
                    color: Colors.green.shade900,
                    width: 25,
                    borderRadius: BorderRadius.circular(4)),
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(
                    toY: wedAmount,
                    color: Colors.green.shade900,
                    width: 25,
                    borderRadius: BorderRadius.circular(4)),
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(
                    toY: thursAmount,
                    color: Colors.green.shade900,
                    width: 25,
                    borderRadius: BorderRadius.circular(4)),
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(
                    toY: friAmount,
                    color: Colors.green.shade900,
                    width: 25,
                    borderRadius: BorderRadius.circular(4)),
              ]),
              BarChartGroupData(x: 5, barRods: [
                BarChartRodData(
                    toY: satAmount,
                    color: Colors.green.shade900,
                    width: 25,
                    borderRadius: BorderRadius.circular(4)),
              ]),
              BarChartGroupData(x: 6, barRods: [
                BarChartRodData(
                    toY: sunAmount,
                    color: Colors.green.shade900,
                    width: 25,
                    borderRadius: BorderRadius.circular(4)),
              ]),
            ]),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta titleMeta) {
  const style = TextStyle(
    color: Colors.black, // Use black for better visibility
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text("S", style: style);
      break;
    case 1:
      text = const Text("M", style: style);
      break;
    case 2:
      text = const Text("T", style: style);
      break;
    case 3:
      text = const Text("W", style: style);
      break;
    case 4:
      text = const Text("T", style: style);
      break;
    case 5:
      text = const Text("F", style: style);
      break;
    case 6:
      text = const Text("S", style: style);
      break;
    default:
      text = const Text("", style: style); // Handle any unexpected value
  }

  return SideTitleWidget(
    axisSide: titleMeta.axisSide,
    space: 8.0,
    child: text,
  );
}
