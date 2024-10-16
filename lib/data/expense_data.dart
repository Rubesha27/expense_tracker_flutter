import 'package:expense_tracker_app/datetime/date_time_helper.dart';
import 'package:expense_tracker_app/models/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {
  //List of all expenses
  List<ExpenseItem> overallExpenseList = [];
  //get expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  //add new expense
  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
    notifyListeners();
  }

  //delete expense
  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
    notifyListeners();
  }

  //get weekday (mon, tues etc) from dateTime object
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tues";
      case 3:
        return "Wed";
      case 4:
        return "Thurs";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "";
    }
  }

  //get the date for the start of the week (Sunday)
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;
    //get todays date
    DateTime today = DateTime.now();
    //go backwards from today's date to find Sunday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == "Sun") {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }
  /*
  convert overall list of expenses into a daily expense summary

  e.g
  overallExpenseList=
  [
  [food, 2024/12/30, $10],
  [hat, 2024/03/30, $15],
  ]

  =>

  DailyExpenseSummary=
  [
  [20241230: $10],
  [20240330: $15],
  ]
   */

  Map<String, double> calculateDailyExpenses() {
    Map<String, double> dailyExpenseSummary = {
      //date(yyyymmdd):amountTotalForDay
    };
    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);
      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}
