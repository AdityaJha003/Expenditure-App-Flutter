import 'package:flutter/material.dart';

import 'add_budget_screen.dart';
import 'add_goal_screen.dart';
import 'add_transaction_screen.dart';
import 'budget_screen.dart';
import 'goals_screen.dart';
import 'transactions_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Finance Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransactionsScreen()),
                );
              },
              child: Text('Transactions'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BudgetScreen()),
                );
              },
              child: Text('Budgets'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoalsScreen()),
                );
              },
              child: Text('Goals'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTransactionScreen()),
                );
              },
              child: Text('Add Transaction'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBudgetScreen()),
                );
              },
              child: Text('Add Budget'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddGoalScreen()),
                );
              },
              child: Text('Add Goal'),
            ),
          ],
        ),
      ),
    );
  }
}
