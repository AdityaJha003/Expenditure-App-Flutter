import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome
import '../models/goal.dart';

class GoalList extends StatelessWidget {
  final List<Goal> goals;

  GoalList(this.goals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: goals.length,
      itemBuilder: (ctx, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: ListTile(
            title: Text(
              goals[index].description,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              'Saved: \$${goals[index].currentAmount} / \$${goals[index].targetAmount}',
            ),
            trailing:
                FaIcon(FontAwesomeIcons.bullseye), // Use a FontAwesome icon
          ),
        );
      },
    );
  }
}
