import 'package:flutter/material.dart';
import '../models/budget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BudgetProvider with ChangeNotifier {
  List<Budget> _budgets = [];

  List<Budget> get budgets => _budgets;

  BudgetProvider() {
    _fetchBudgets();
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'budgets.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE budgets(id TEXT PRIMARY KEY, category TEXT, limit REAL, spent REAL)",
        );
      },
      version: 1,
    );
  }

  Future<void> _fetchBudgets() async {
    final db = await _initDatabase();
    final List<Map<String, dynamic>> maps = await db.query('budgets');
    _budgets = List.generate(maps.length, (i) {
      return Budget.fromMap(maps[i]);
    });
    notifyListeners();
  }

  void addBudget(Budget budget) async {
    final db = await _initDatabase();
    await db.insert(
      'budgets',
      budget.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _budgets.add(budget);
    notifyListeners();
  }
}
