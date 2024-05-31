import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/goal_provider.dart';
import '../widgets/goal_list.dart';

class GoalsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goals'),
      ),
      body: Consumer<GoalProvider>(
        builder: (context, goalProvider, child) {
          return GoalList(goalProvider.goals);
        },
      ),
    );
  }
}
