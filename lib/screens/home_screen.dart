import 'package:expense_tracker_app/components/expense_summary.dart';
import 'package:expense_tracker_app/data/expense_data.dart';
import 'package:expense_tracker_app/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Controllers
  final TextEditingController newExpenseNameController =
      TextEditingController();

  final TextEditingController newExpenseAmountController =
      TextEditingController();

  //add new expense
  void addNewExpense() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Add new expense"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //expense name
                  TextField(
                    controller: newExpenseNameController,
                    decoration: InputDecoration(
                      label: Text("Enter expense name"),
                    ),
                  ),
                  //expense amount
                  TextField(
                    controller: newExpenseAmountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Enter amount"),
                    ),
                  )
                ],
              ),
              actions: [
                //save button
                MaterialButton(
                  onPressed: save,
                  child: const Text("Save"),
                ),

                //cancel button
                MaterialButton(
                  onPressed: cancel,
                  child: const Text("Cancel"),
                ),
              ],
            ));
  }

  //save
  void save() {
    //create expense item
    ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: newExpenseAmountController.text,
        dateTime: DateTime.now());
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
    Navigator.pop(context);
  }

  //cancel
  void cancel() {
    Navigator.pop(context);
  }

  //clear controllers
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    newExpenseAmountController.clear();
    newExpenseNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(title: const Text('SmartExpense')),
              backgroundColor: Colors.green.shade300,
              floatingActionButton: FloatingActionButton(
                onPressed: addNewExpense,
                child: const Icon(Icons.add),
              ),
              body: Column(
                children: [
                  //weekly summary
                  ExpenseSummary(startOfWeek: value.startOfWeekDate()),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.getAllExpenseList().length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(value.getAllExpenseList()[index].name),
                      subtitle: Text(
                          "${value.getAllExpenseList()[index].dateTime.day}/${value.getAllExpenseList()[index].dateTime.month}/${value.getAllExpenseList()[index].dateTime.year}"),
                      trailing:
                          Text("Rs ${value.getAllExpenseList()[index].amount}"),
                    ),
                  ),
                ],
              ),
            ));
  }
}
