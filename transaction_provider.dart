import 'package:flutter/material.dart';
import 'package:financeapp/models/transaction.dart' as finance;
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';

class TransactionProvider with ChangeNotifier {
  List<finance.Transaction> _transactions = [];

  List<finance.Transaction> get transactions => _transactions;

  Future<void> addTransaction(finance.Transaction transaction) async {
    final db = await _getDatabase();
    await db.insert(
      'transactions',
      transaction.toMap(),
      conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
    );
    _transactions.add(transaction);
    notifyListeners();
  }

  Future<void> fetchAndSetTransactions() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('transactions');

    _transactions = List.generate(maps.length, (i) {
      return finance.Transaction(
        id: maps[i]['id'],
        title: maps[i]['title'],
        amount: maps[i]['amount'],
        date: DateTime.parse(maps[i]['date']),
      );
    });
    notifyListeners();
  }

  Future<sqflite.Database> _getDatabase() async {
    return sqflite.openDatabase(
      join(await sqflite.getDatabasesPath(), 'transactions.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE transactions(id TEXT PRIMARY KEY, title TEXT, amount REAL, date TEXT)',
        );
      },
      version: 1,
    );
  }
}
