import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/budget_provider.dart';
import '../widgets/budget_overview.dart';

class BudgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budgets'),
      ),
      body: Consumer<BudgetProvider>(
        builder: (context, budgetProvider, child) {
          return BudgetOverview(budgetProvider.budgets);
        },
      ),
    );
  }
}
