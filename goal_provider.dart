import 'package:flutter/material.dart';
import '../models/goal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class GoalProvider with ChangeNotifier {
  List<Goal> _goals = [];

  List<Goal> get goals => _goals;

  GoalProvider() {
    _fetchGoals();
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'goals.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE goals(id TEXT PRIMARY KEY, description TEXT, targetAmount REAL, currentAmount REAL)",
        );
      },
      version: 1,
    );
  }

  Future<void> _fetchGoals() async {
    final db = await _initDatabase();
    final List<Map<String, dynamic>> maps = await db.query('goals');
    _goals = List.generate(maps.length, (i) {
      return Goal.fromMap(maps[i]);
    });
    notifyListeners();
  }

  void addGoal(Goal goal) async {
    final db = await _initDatabase();
    await db.insert(
      'goals',
      goal.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _goals.add(goal);
    notifyListeners();
  }
}
