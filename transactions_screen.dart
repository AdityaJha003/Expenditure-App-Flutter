import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';
import '../widgets/transaction_list.dart';

class TransactionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: Consumer<TransactionProvider>(
        builder: (context, transactionProvider, child) {
          return TransactionList(transactionProvider.transactions);
        },
      ),
    );
  }
}
