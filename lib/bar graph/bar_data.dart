import 'package:expense_tracker_app/bar%20graph/individual_bar.dart';

class BarData {
  final double monAmount;
  final double tuesAmount;
  final double wedAmount;
  final double thursAmount;
  final double friAmount;
  final double satAmount;
  final double sunAmount;
  BarData(
      {required this.monAmount,
      required this.tuesAmount,
      required this.wedAmount,
      required this.thursAmount,
      required this.friAmount,
      required this.satAmount,
      required this.sunAmount});
  List<IndivisualBar> barData = [];
  //initialize bar data
  void initializeBarData() {
    barData = [
      //sun
      IndivisualBar(x: 0, y: sunAmount),
      //mon
      IndivisualBar(x: 0, y: monAmount),
      //tues
      IndivisualBar(x: 0, y: tuesAmount),
      //Wed
      IndivisualBar(x: 0, y: wedAmount),
      //thurs
      IndivisualBar(x: 0, y: thursAmount),
      //fri
      IndivisualBar(x: 0, y: friAmount),
      //sat
      IndivisualBar(x: 0, y: satAmount),
    ];
  }
}
