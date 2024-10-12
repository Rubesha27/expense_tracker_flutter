import 'package:expense_tracker_app/bar%20graph/bar_graph.dart';
import 'package:expense_tracker_app/data/expense_data.dart';
import 'package:expense_tracker_app/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenseSummary({super.key, required this.startOfWeek});

  @override
  Widget build(BuildContext context) {
    // Get yyyymmdd string for each day of the week in the correct order
    String sunday = convertDateTimeToString(startOfWeek.add(Duration(days: 0)));
    String monday = convertDateTimeToString(startOfWeek.add(Duration(days: 1)));
    String tuesday =
        convertDateTimeToString(startOfWeek.add(Duration(days: 2)));
    String wednesday =
        convertDateTimeToString(startOfWeek.add(Duration(days: 3)));
    String thursday =
        convertDateTimeToString(startOfWeek.add(Duration(days: 4)));
    String friday = convertDateTimeToString(startOfWeek.add(Duration(days: 5)));
    String saturday =
        convertDateTimeToString(startOfWeek.add(Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: MyBarGraph(
          maxY: 200,
          monAmount: value.calculateDailyExpenses()[monday] ?? 0,
          tuesAmount: value.calculateDailyExpenses()[tuesday] ?? 0,
          wedAmount: value.calculateDailyExpenses()[wednesday] ?? 0,
          thursAmount: value.calculateDailyExpenses()[thursday] ?? 0,
          friAmount: value.calculateDailyExpenses()[friday] ?? 0,
          satAmount: value.calculateDailyExpenses()[saturday] ?? 0,
          sunAmount: value.calculateDailyExpenses()[sunday] ?? 0,
        ),
      ),
    );
  }
}
