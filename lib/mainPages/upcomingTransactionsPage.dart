// ignore_for_file: file_names, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../lists.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Upcoming Transactions",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: (Container(child: const PastTransactionsList())),
    );
  }
}

class PastTransactionsList extends StatefulWidget {
  const PastTransactionsList();

  @override
  State<PastTransactionsList> createState() => _PastTransactionsListListState();
}

class _PastTransactionsListListState extends State<PastTransactionsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        itemCount: upcomingTransactions.length - 1,
        itemBuilder: (context, int index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.greenAccent, width: 0.25),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: upcomingTransactions[index][0],
              title: Text(
                upcomingTransactions[index][1],
                style: const TextStyle(color: Colors.greenAccent),
              ),
              subtitle: Text(upcomingTransactions[index][3]),
              trailing: Text(DateFormat.MMMMEEEEd()
                  .format(upcomingTransactions[index][2])
                  .toString()),
            ),
          );
        });
  }
}
