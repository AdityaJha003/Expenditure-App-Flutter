import 'package:flutter/material.dart';
import '../models/budget.dart';

class BudgetOverview extends StatelessWidget {
  final List<Budget> budgets;

  BudgetOverview(this.budgets);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: budgets.length,
      itemBuilder: (ctx, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: ListTile(
            title: Text(
              budgets[index].category,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              'Spent: \$${budgets[index].spent} / \$${budgets[index].limit}',
            ),
            trailing: Icon(Icons.money),
          ),
        );
      },
    );
  }
}
